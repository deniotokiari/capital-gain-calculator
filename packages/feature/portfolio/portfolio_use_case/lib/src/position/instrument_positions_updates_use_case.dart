import 'package:common/common.dart';
import 'package:db/db.dart' as db;
import 'package:portfolio_data/portfolio_data.dart';

class InstrumentPositionsUpdatesUseCase implements UseCase<String, Stream<Position>> {
  final db.PositionRepository _positionRepository;

  InstrumentPositionsUpdatesUseCase(
    this._positionRepository,
  );

  @override
  Stream<Position> execute(String args) async* {
    await for (final item in _positionRepository.stream()) {
      if (item.instrumentId == args) {
        yield Position(
          id: item.id,
          count: item.count,
          price: item.price,
          date: item.date,
        );
      }
    }
  }
}
