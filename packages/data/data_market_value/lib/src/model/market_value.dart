import 'package:data_currency/currency.dart';

class MarketValue {
  final double count;
  final CurrencyValue current;
  final CurrencyValue invested;

  MarketValue({
    required this.count,
    required this.current,
    required this.invested,
  });

  CurrencyValue get market => current * count;

  CurrencyValue get interest => market - invested;

  double get percent => interest.value / invested.value;

  String get formattedMarket => market.toString();

  String get formattedInterest => '${interest.value > 0 ? '+' : '-'}${interest.toString()}';

  String get formattedPercent => '${percent > 0 ? '+' : '-'}${(percent * 100).toStringAsFixed(2)}%';
}
