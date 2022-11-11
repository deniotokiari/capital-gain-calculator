import 'package:db/src/common/db_entity.dart';
import 'package:db/src/common/db_repository.dart';
import 'package:db/src/physical_currency_value.dart';
import 'package:intl/intl.dart';

final _dateFormatter = DateFormat('yyyy-MM-dd');

class Quote extends DbEntity {
  final String symbolId;
  final PhysicalCurrencyValue previousClose;
  final DateTime latestTradingDay;

  Quote({
    required this.symbolId,
    required this.previousClose,
    required this.latestTradingDay,
  });

  factory Quote.fromMap(Map<String, dynamic> map) => Quote(
        symbolId: map['symbolId'],
        previousClose: PhysicalCurrencyValue.fromMap(map['previousClose']),
        latestTradingDay: _dateFormatter.parse(map['latestTradingDay']),
      );

  @override
  Iterable get itemsForId => [symbolId];

  @override
  Map<String, dynamic> get toMap => {
        'symbolId': symbolId,
        'previousClose': previousClose.toMap(),
        'latestTradingDay': _dateFormatter.format(latestTradingDay),
      };
}

class QuoteRepository extends DbRepository<Quote> {
  @override
  Quote converter(Map<String, dynamic> map) => Quote.fromMap(map);
}
