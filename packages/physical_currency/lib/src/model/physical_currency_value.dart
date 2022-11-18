import 'package:physical_currency/src/model/physical_currency.dart';

class PhysicalCurrencyValue {
  final PhysicalCurrency currency;
  final double value;

  PhysicalCurrencyValue({
    required this.currency,
    required this.value,
  });

  String get market => '${currency.sign}${value.toStringAsFixed(2)}';

  String get gainOrLoss => '${value < 0 ? '-' : '+'}${currency.sign}${value.abs().toStringAsFixed(2)}';
}
