import 'package:physical_currency/physical_currency.dart';

class Position {
  final String id;
  final double count;
  final PhysicalCurrencyValue price;
  final DateTime date;

  Position({
    required this.id,
    required this.count,
    required this.price,
    required this.date,
  });

  String get averagePrice => (price.value / count).toStringAsFixed(2);
}
