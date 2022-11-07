import 'package:physical_currency/physical_currency.dart';

class Position {
  final String id;
  final double count;
  final double price;
  final PhysicalCurrency physicalCurrency;
  final DateTime date;

  Position({
    required this.id,
    required this.count,
    required this.price,
    required this.physicalCurrency,
    required this.date,
  });
}
