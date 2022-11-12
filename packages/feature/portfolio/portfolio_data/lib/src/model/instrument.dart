import 'package:portfolio_data/portfolio_data.dart';

class Instrument {
  final String id;
  final Symbol? symbol;
  final double count;
  final double averagePrice;
  final double invested;
  final double lastPrice;
  final double returnValue;
  final double returnPercent;

  Instrument({
    required this.id,
    required this.symbol,
    required this.count,
    required this.averagePrice,
    required this.invested,
    required this.lastPrice,
    required this.returnValue,
    required this.returnPercent,
  });

  factory Instrument.symbol({
    required String id,
    required Symbol symbol,
    required double count,
    required double averagePrice,
    required double invested,
    required double lastPrice,
    required double returnValue,
    required double returnPercent,
  }) =>
      Instrument(
        id: id,
        symbol: symbol,
        count: count,
        averagePrice: averagePrice,
        invested: invested,
        lastPrice: lastPrice,
        returnValue: returnValue,
        returnPercent: returnPercent,
      );
}
