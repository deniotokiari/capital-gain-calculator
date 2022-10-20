import 'package:common/common.dart';

class PortfolioInstrumentPosition extends LocalStorageEntity {
  final String portfolioInstrumentId;
  final double count;
  final double price;
  final DateTime date;

  PortfolioInstrumentPosition({
    required this.portfolioInstrumentId,
    required this.count,
    required this.price,
    required this.date,
  });

  factory PortfolioInstrumentPosition.fromMap(Map<String, dynamic> map) {
    final date = (map['date'] as String).split('/');

    return PortfolioInstrumentPosition(
      portfolioInstrumentId: map['portfolioInstrumentId'],
      count: map['count'],
      price: map['price'],
      date: DateTime(
        int.parse(date[0]),
        int.parse(date[1]),
        int.parse(date[2]),
      ),
    );
  }

  @override
  Iterable get itemsForId => [portfolioInstrumentId, count, price, date];

  @override
  Map<String, dynamic> get toMap => {
        'portfolioInstrumentId': portfolioInstrumentId,
        'count': count,
        'price': price,
        'date': '${date.year}/${date.month}/${date.day}',
      };
}
