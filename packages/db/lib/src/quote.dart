import 'package:db/src/common/db_entity.dart';
import 'package:db/src/common/db_repository.dart';

class Quote extends DbEntity {
  final String symbolId;
  final String previousClose;

  Quote({
    required this.symbolId,
    required this.previousClose,
  });

  factory Quote.fromMap(Map<String, dynamic> map) => Quote(
        symbolId: map['symbolId'],
        previousClose: map['previousClose'],
      );

  @override
  Iterable get itemsForId => [symbolId];

  @override
  Map<String, dynamic> get toMap => {
        'symbolId': symbolId,
        'previousClose': previousClose,
      };
}

class QuoteRepository extends DbRepository {
  @override
  Quote converter(Map<String, dynamic> map) => Quote.fromMap(map);
}
