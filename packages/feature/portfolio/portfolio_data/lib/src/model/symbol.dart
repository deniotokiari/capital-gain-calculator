import 'package:physical_currency/physical_currency.dart';

class Symbol {
  final String id;
  final String name;
  final String ticker;
  final String region;
  final PhysicalCurrency physicalCurrency;

  Symbol({
    required this.id,
    required this.name,
    required this.ticker,
    required this.region,
    required this.physicalCurrency,
  });
}
