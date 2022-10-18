import 'package:common/common.dart';

class Symbol extends LocalStorageEntity {
  String name;
  String symbol;
  String region;
  String physicalCurrencyId;

  Symbol({
    required this.name,
    required this.symbol,
    required this.region,
    required this.physicalCurrencyId,
  });

  factory Symbol.fromMap(Map<String, dynamic> map) => Symbol(
        name: map['name'],
        symbol: map['symbol'],
        region: map['region'],
        physicalCurrencyId: map['physicalCurrencyId'],
      );

  @override
  Iterable get itemsForId => [name, symbol, region, physicalCurrencyId];

  @override
  Map<String, dynamic> get toMap => {
        'name': name,
        'symbol': symbol,
        'region': region,
        'physicalCurrencyId': physicalCurrencyId,
      };
}
