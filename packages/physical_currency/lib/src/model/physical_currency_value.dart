import 'package:physical_currency/src/model/physical_currency.dart';

class PhysicalCurrencyValue {
  final PhysicalCurrency currency;
  final double value;

  PhysicalCurrencyValue({
    required this.currency,
    required this.value,
  });
}
