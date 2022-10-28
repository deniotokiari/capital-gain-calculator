import 'package:db/src/common/db_entity.dart';
import 'package:db/src/common/db_repository.dart';
import 'package:intl/intl.dart';

final _dateFormatter = DateFormat('d MMMM yyyy HH mm');

class Position extends DbEntity {
  final String instrumentId;
  final String physicalCurrencyId;
  final double count;
  final DateTime date;
  final double price;

  Position({
    required this.instrumentId,
    required this.physicalCurrencyId,
    required this.count,
    required this.date,
    required this.price,
  });

  factory Position.fromMap(Map<String, dynamic> map) => Position(
        instrumentId: map['instrumentId'],
        physicalCurrencyId: map['physicalCurrencyId'],
        count: map['count'],
        date: _dateFormatter.parse(map['date']),
        price: map['price'],
      );

  @override
  Iterable get itemsForId => [
        instrumentId,
        physicalCurrencyId,
        count,
        date,
        price,
      ];

  @override
  Map<String, dynamic> get toMap => {
        'instrumentId': instrumentId,
        'physicalCurrencyId': physicalCurrencyId,
        'count': count,
        'date': _dateFormatter.format(date),
        'price': price,
      };
}

class PositionRepository extends DbRepository<Position> {
  @override
  Position converter(Map<String, dynamic> map) => Position.fromMap(map);
}
