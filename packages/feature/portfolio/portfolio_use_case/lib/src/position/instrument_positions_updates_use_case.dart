import 'package:common/common.dart';
import 'package:db/db.dart' as db;
import 'package:physical_currency/physical_currency.dart';
import 'package:portfolio_data/portfolio_data.dart';

class InstrumentPositionsUpdatesUseCase implements UseCase<String, Stream<Position>> {
  final db.PositionRepository _positionRepository;
  final GetPhysicalCurrencyByIdUseCase _getPhysicalCurrencyByIdUseCase;

  InstrumentPositionsUpdatesUseCase(
    this._positionRepository,
    this._getPhysicalCurrencyByIdUseCase,
  );

  @override
  Stream<Position> execute(String args) async* {
    await for (final item in _positionRepository.stream()) {
      if (item.instrumentId == args) {
        yield Position(
          id: item.id,
          count: item.count,
          price: PhysicalCurrencyValue(
            currency: await _getPhysicalCurrencyByIdUseCase.execute(item.price.currencyId),
            value: item.price.value,
          ),
          date: item.date,
          lastPrice: 0,
          returnValue: 0,
          returnPercent: 0,
        );
      }
    }
  }
}
