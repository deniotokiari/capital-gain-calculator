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
          price: item.price,
          physicalCurrency: await _getPhysicalCurrencyByIdUseCase.execute(item.physicalCurrencyId),
          date: item.date,
        );
      }
    }
  }
}
