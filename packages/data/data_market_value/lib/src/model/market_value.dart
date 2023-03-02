import 'package:data_currency/currency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_value.freezed.dart';

@freezed
class MarketValue with _$MarketValue {
  const MarketValue._();

  factory MarketValue.calculated({
    required double count,
    required CurrencyValue current,
    required CurrencyValue invested,
  }) = _MarketValueCalculated;

  factory MarketValue({
    required CurrencyValue market,
    required CurrencyValue interest,
    required double percent,
  }) = _MarketValue;

  CurrencyValue get market => map(
        (value) => value.market,
        calculated: (calculated) => calculated.current * calculated.count,
      );

  CurrencyValue get interest => map(
        (value) => value.interest,
        calculated: (calculated) => calculated.market - calculated.invested,
      );

  double get percent => map(
        (value) => value.percent,
        calculated: (calculated) => interest.value / calculated.invested.value,
      );

  double? get count => map((value) => null, calculated: (calculated) => calculated.count);

  String get formattedMarket => '${market.value.toStringAsFixed(2)}${market.currency.code}';

  String get formattedInterest => '${interest.value > 0 ? '+' : '-'}${interest.value.abs().toStringAsFixed(2)}${interest.currency.code}';

  String get formattedPercent => '${percent > 0 ? '+' : '-'}${(percent * 100).abs().toStringAsFixed(2)}%';
}
