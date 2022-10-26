import 'package:db/src/common/db_entity.dart';
import 'package:db/src/common/db_repository.dart';

class Instrument extends DbEntity {
  final String portfolioId;
  final String? symbolId;
  final String? cryptoCurrencyId;

  Instrument._({
    required this.portfolioId,
    required this.symbolId,
    required this.cryptoCurrencyId,
  });

  factory Instrument.symbol({
    required String portfolioId,
    required String symbolId,
  }) =>
      Instrument._(
        portfolioId: portfolioId,
        symbolId: symbolId,
        cryptoCurrencyId: null,
      );

  factory Instrument.crypto({
    required String portfolioId,
    required String cryptoCurrencyId,
  }) =>
      Instrument._(
        portfolioId: portfolioId,
        symbolId: null,
        cryptoCurrencyId: cryptoCurrencyId,
      );

  factory Instrument.fromMap(Map<String, dynamic> map) => Instrument._(
        portfolioId: map['portfolioId'],
        symbolId: map['symbolId'],
        cryptoCurrencyId: map['cryptoCurrencyId'],
      );

  @override
  Iterable get itemsForId => [
        portfolioId,
        symbolId,
        cryptoCurrencyId,
      ];

  @override
  Map<String, dynamic> get toMap => {
        'portfolioId': portfolioId,
        'symbolId': symbolId,
        'cryptoCurrencyId': cryptoCurrencyId,
      };
}

class InstrumentRepository extends DbRepository<Instrument> {
  @override
  Instrument converter(Map<String, dynamic> map) => Instrument.fromMap(map);
}
