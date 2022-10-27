import 'package:physical_currency/physical_currency.dart';

class Portfolio {
  final String id;
  final String name;
  final PhysicalCurrency physicalCurrency;

  Portfolio({
    required this.id,
    required this.name,
    required this.physicalCurrency,
  });
}
