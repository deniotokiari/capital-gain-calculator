import 'package:collection/collection.dart';
import 'package:common/common.dart';

class SymbolRepository {
  final LocalStorage _localStorage;

  SymbolRepository(this._localStorage);

  Future<void> add(Symbol symbol) {
    return _localStorage.save(symbol);
  }

  Future<Symbol?> get(String id) {
    return _localStorage.collection(Symbol.fromMap).then(
          (value) => value
              ?.where(
                (element) => element.id == id,
              )
              .firstOrNull,
        );
  }

  Future<List<Symbol>> getByIds(Iterable<String> ids) {
    return _localStorage.collection(Symbol.fromMap).then(
          (value) =>
              value
                  ?.where(
                    (element) => ids.contains(element.id),
                  )
                  .toList(growable: false) ??
              [],
        );
  }
}

class Symbol extends LocalStorageEntity {
  final String symbol;
  final String name;
  final String type;
  final String region;
  final String currency;

  Symbol({
    required this.symbol,
    required this.name,
    required this.type,
    required this.region,
    required this.currency,
  });

  factory Symbol.fromMap(Map<String, dynamic> map) => Symbol(
        symbol: map['symbol'],
        name: map['name'],
        type: map['type'],
        region: map['region'],
        currency: map['currency'],
      );

  @override
  String get id => Object.hashAll([
        symbol,
        name,
        type,
        region,
        currency,
      ]).toString();

  @override
  Map<String, dynamic> get toMap => {
        'symbol': symbol,
        'name': name,
        'type': type,
        'region': region,
        'currency': currency,
      };
}
