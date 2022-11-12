import 'package:common/common.dart';
import 'package:db/db.dart' as db;
import 'package:physical_currency/physical_currency.dart';
import 'package:portfolio_data/portfolio_data.dart';

class GetPositionsByInstrumentIdUseCase implements UseCase<String, Future<List<Position>>> {
  final db.PositionRepository _positionRepository;
  final db.QuoteRepository _quoteRepository;
  final db.InstrumentRepository _instrumentRepository;
  final GetPhysicalCurrencyByIdUseCase _getPhysicalCurrencyByIdUseCase;

  GetPositionsByInstrumentIdUseCase(
    this._positionRepository,
    this._quoteRepository,
    this._instrumentRepository,
    this._getPhysicalCurrencyByIdUseCase,
  );

  @override
  Future<List<Position>> execute(String args) async {
    final instrument = await _instrumentRepository.get(args);
    final quote = await _quoteRepository
        .where((map) => map['symbolId'] == instrument.symbolId)
        .then((value) => value.isEmpty ? null : value.first);
    final positions = await _positionRepository.where((map) => map['instrumentId'] == args);
    final result = <Position>[];

    for (final item in positions) {
      final lastPrice = quote?.previousClose.value ?? 0;
      final price = PhysicalCurrencyValue(
        currency: await _getPhysicalCurrencyByIdUseCase.execute(item.price.currencyId),
        value: item.price.value,
      );
      final returnValue = lastPrice * item.count - price.value;
      final returnPercent = returnValue / price.value;

      result.add(Position(
        id: item.id,
        count: item.count,
        price: price,
        date: item.date,
        lastPrice: lastPrice,
        returnValue: returnValue,
        returnPercent: returnPercent,
      ));
    }

    return result;
  }
}
