import 'package:common/common.dart';
import 'package:time_machine/time_machine.dart';
import 'package:time_machine/time_machine_text_patterns.dart';

class PortfolioInstrumentPosition extends LocalStorageEntity {
  final String portfolioInstrumentId;
  final double count;
  final double price;
  final LocalDate date;

  PortfolioInstrumentPosition({
    required this.portfolioInstrumentId,
    required this.count,
    required this.price,
    required this.date,
  });

  factory PortfolioInstrumentPosition.fromMap(Map<String, dynamic> map) =>
      PortfolioInstrumentPosition(
        portfolioInstrumentId: map['portfolioInstrumentId'],
        count: map['count'],
        price: map['price'],
        date: LocalDatePattern.createWithCurrentCulture('yyyy-mm-dd').parse(map['date']).value,
      );

  @override
  Iterable get itemsForId => [portfolioInstrumentId, count, price, date];

  @override
  Map<String, dynamic> get toMap => {
        'portfolioInstrumentId': portfolioInstrumentId,
        'count': count,
        'price': price,
        'date': date.toString('yyyy-mm-dd'),
      };
}
