import 'package:data_currency/currency.dart';
import 'package:store/model/db_entity.dart';

class CurrencyExchangeRate extends DbEntity {
  final Currency from;
  final Currency to;
  final double exchangeRate;

  CurrencyExchangeRate({
    required this.from,
    required this.to,
    required this.exchangeRate,
  });

  factory CurrencyExchangeRate.fromMap(Map<String, dynamic> map) => CurrencyExchangeRate(
        from: Currency.fromMap(map['from']),
        to: Currency.fromMap(map['to']),
        exchangeRate: map['exchange_rate'],
      );

  @override
  String get id => generateId(from: from, to: to);

  @override
  Iterable get itemsForId => [from.code, to.code];

  @override
  Map<String, dynamic> get map => {
        'from': from.toMap,
        'to': to.toMap,
        'exchange_rate': exchangeRate,
      };

  static String generateId({required Currency from, required Currency to}) => '${from.code}_${to.code}';
}
