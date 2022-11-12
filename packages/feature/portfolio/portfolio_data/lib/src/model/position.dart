import 'package:physical_currency/physical_currency.dart';

class Position {
  final String id;
  final double count;
  final PhysicalCurrencyValue price;
  final DateTime date;
  final double lastPrice;
  final double returnValue;
  final double returnPercent;

  Position({
    required this.id,
    required this.count,
    required this.price,
    required this.date,
    required this.lastPrice,
    required this.returnValue,
    required this.returnPercent,
  });

  String get averagePrice => (price.value / count).toStringAsFixed(2);
}
