import 'package:portfolio_data/portfolio_data.dart';

class Instrument {
  final String id;
  final Symbol? symbol;
  final double count;
  final double averagePrice;

  Instrument({
    required this.id,
    required this.symbol,
    required this.count,
    required this.averagePrice,
  });

  factory Instrument.symbol(
          {required String id,
          required Symbol symbol,
          required double count,
          required double averagePrice}) =>
      Instrument(
        id: id,
        symbol: symbol,
        count: count,
        averagePrice: averagePrice,
      );
}
