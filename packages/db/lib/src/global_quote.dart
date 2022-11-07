import 'package:db/src/common/db_entity.dart';

class GlobalQuote extends DbEntity {
  final String symbolId;
  final String open;
  final String high;
  final String low;
  final String price;
  final String volume;
  final DateTime latestTradingDay;
  final String previousClose;
  final String change;
  final String changePercent;

  GlobalQuote({
    required this.symbolId,
    required this.open,
    required this.high,
    required this.low,
    required this.price,
    required this.volume,
    required this.latestTradingDay,
    required this.previousClose,
    required this.change,
    required this.changePercent,
  });

  @override
  Iterable get itemsForId => [symbolId];

  @override
  Map<String, dynamic> get toMap => {};
}
