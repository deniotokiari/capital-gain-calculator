import 'package:portfolio_data/portfolio_data.dart';

class Instrument {
  final String id;
  final Symbol? symbol;

  Instrument({
    required this.id,
    required this.symbol,
  });

  factory Instrument.symbol({
    required String id,
    required Symbol symbol,
  }) =>
      Instrument(
        id: id,
        symbol: symbol,
      );
}
