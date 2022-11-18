import 'package:db/src/common/db_entity.dart';
import 'package:db/src/common/db_repository.dart';
import 'package:db/src/physical_currency_value.dart';
import 'package:intl/intl.dart';

final _dateFormatter = DateFormat('d MMMM yyyy HH mm');

class Position extends DbEntity {
  final String instrumentId;
  final double count;
  final DateTime date;
  final PhysicalCurrencyValue price;

  Position({
    required this.instrumentId,
    required this.count,
    required this.date,
    required this.price,
  });

  factory Position.fromMap(Map<String, dynamic> map) => Position(
        instrumentId: map['instrumentId'],
        count: map['count'],
        date: _dateFormatter.parse(map['date']),
        price: PhysicalCurrencyValue.fromMap(map['price']),
      );

  @override
  Iterable get itemsForId => [
        instrumentId,
        count,
        _dateFormatter.format(date),
        price.value,
        price.currencyId,
      ];

  @override
  Map<String, dynamic> get toMap => {
        'instrumentId': instrumentId,
        'count': count,
        'date': _dateFormatter.format(date),
        'price': price.toMap(),
      };
}

class PositionRepository extends DbRepository<Position> {
  @override
  Position converter(Map<String, dynamic> map) => Position.fromMap(map);
}
