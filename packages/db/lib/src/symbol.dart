import 'package:db/src/common/db_entity.dart';
import 'package:db/src/common/db_repository.dart';

class Symbol extends DbEntity {
  final String name;
  final String ticker;
  final String region;
  final String physicalCurrencyId;

  Symbol({
    required this.name,
    required this.ticker,
    required this.region,
    required this.physicalCurrencyId,
  });

  factory Symbol.fromMap(Map<String, dynamic> map) => Symbol(
        name: map['name'],
        ticker: map['ticker'],
        region: map['region'],
        physicalCurrencyId: map['physicalCurrencyId'],
      );

  @override
  Iterable get itemsForId => [
        name,
        ticker,
        region,
        physicalCurrencyId,
      ];

  @override
  Map<String, dynamic> get toMap => {
        'name': name,
        'ticker': ticker,
        'region': region,
        'physicalCurrencyId': physicalCurrencyId,
      };
}

class SymbolRepository extends DbRepository<Symbol> {
  @override
  Symbol converter(Map<String, dynamic> map) => Symbol.fromMap(map);
}
