import 'package:store/model/db_entity.dart';

class Instrument extends DbEntity {
  final String portfolioId;
  final String symbolId;

  Instrument({
    required this.portfolioId,
    required this.symbolId,
  });

  factory Instrument.fromMap(Map<String, dynamic> map) => Instrument(
        portfolioId: map['portfolio_id'],
        symbolId: map['symbol_id'],
      );

  @override
  Iterable get itemsForId => [portfolioId, symbolId];

  @override
  Map<String, dynamic> get map => {
        'portfolio_id': portfolioId,
        'symbol_id': symbolId,
      };
}
