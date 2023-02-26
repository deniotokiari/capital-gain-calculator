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
}

extension DoubleExt on double {
  String get percent => '${this > 0 ? '+' : '-'}${(this * 100).abs().toStringAsFixed(2)}%';
}
