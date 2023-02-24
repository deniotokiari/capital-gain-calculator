import 'package:data_currency/currency.dart';
import 'package:store/model/db_entity.dart';

class Symbol extends DbEntity {
  String name;
  String ticker;
  String region;
  Currency currency;
  GlobalQuote? globalQuote;

  Symbol({
    required this.name,
    required this.ticker,
    required this.region,
    required this.currency,
    required this.globalQuote,
  });

  factory Symbol.fromMap(Map<String, dynamic> map) => Symbol(
        name: map['name'],
        ticker: map['ticker'],
        region: map['region'],
        currency: Currency.fromMap(map['currency']),
        globalQuote: map['globalQuote'] != null ? GlobalQuote.fromMap(map['globalQuote']) : null,
      );

  @override
  Iterable get itemsForId => [name, ticker, region, currency.code];

  @override
  Map<String, dynamic> get map => {
        'name': name,
        'ticker': ticker,
        'region': region,
        'currency': currency.toMap,
        if (globalQuote != null) 'globalQuote': globalQuote?.toMap,
      };
}

class GlobalQuote {
  final CurrencyValue open;
  final CurrencyValue high;
  final CurrencyValue low;
  final CurrencyValue price;
  final CurrencyValue close;

  GlobalQuote({
    required this.open,
    required this.high,
    required this.low,
    required this.price,
    required this.close,
  });

  factory GlobalQuote.fromMap(Map<String, dynamic> map) => GlobalQuote(
        open: CurrencyValue.fromMap(map['open']),
        high: CurrencyValue.fromMap(map['high']),
        low: CurrencyValue.fromMap(map['low']),
        price: CurrencyValue.fromMap(map['price']),
        close: CurrencyValue.fromMap(map['close']),
      );

  Map<String, dynamic> get toMap => {
        'open': open.toMap,
        'high': high.toMap,
        'low': low.toMap,
        'price': price.toMap,
        'close': close.toMap,
      };
}
