import 'package:data_currency/currency.dart';
import 'package:store/model/db_entity.dart';

class Position extends DbEntity {
  final String instrumentId;
  final double count;
  final CurrencyValue price;
  final DateTime date;

  Position({
    required this.instrumentId,
    required this.count,
    required this.price,
    required this.date,
  });

  factory Position.fromMap(Map<String, dynamic> map) => Position(
        instrumentId: map['instrument_id'],
        count: map['count'],
        price: CurrencyValue(
          value: map['price_value'],
          currency: Currency(
            code: map['price_currency_code'],
            name: map['price_currency_name'],
          ),
        ),
        date: DateTime(
          map['date_year'],
          map['date_month'],
          map['date_day'],
          map['date_hour'],
          map['date_minute'],
          map['date_second'],
        ),
      );

  @override
  Iterable get itemsForId => [
        instrumentId,
        count,
        price.value,
        price.currency.code,
        date.year,
        date.month,
        date.day,
        date.hour,
        date.minute,
        date.second,
      ];

  @override
  Map<String, dynamic> get map => {
        'instrument_id': instrumentId,
        'count': count,
        'price_value': price.value,
        'price_currency_code': price.currency.code,
        'price_currency_name': price.currency.name,
        'date_year': date.year,
        'date_month': date.month,
        'date_day': date.day,
        'date_hour': date.hour,
        'date_minute': date.minute,
        'date_second': date.second,
      };
}
