import 'package:data_currency/currency.dart';
import 'package:store/model/db_entity.dart';

class Symbol extends DbEntity {
  String name;
  String ticker;
  String region;
  Currency currency;

  Symbol({
    required this.name,
    required this.ticker,
    required this.region,
    required this.currency,
  });

  factory Symbol.fromMap(Map<String, dynamic> map) => Symbol(
        name: map['name'],
        ticker: map['ticker'],
        region: map['region'],
        currency: Currency(code: map['currency_code'], name: map['currency_name']),
      );

  @override
  Iterable get itemsForId => [name, ticker, region, currency.code];

  @override
  Map<String, dynamic> get map => {
        'name': name,
        'ticker': ticker,
        'region': region,
        'currency_code': currency.code,
        'currency_name': currency.name,
      };
}
