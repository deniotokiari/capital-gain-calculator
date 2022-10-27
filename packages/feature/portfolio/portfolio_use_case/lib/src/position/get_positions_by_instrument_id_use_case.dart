import 'package:common/common.dart';
import 'package:db/db.dart' as db;
import 'package:portfolio_data/portfolio_data.dart';

class GetPositionsByInstrumentIdUseCase implements UseCase<String, Future<List<Position>>> {
  final db.PositionRepository _positionRepository;

  GetPositionsByInstrumentIdUseCase(
    this._positionRepository,
  );

  @override
  Future<List<Position>> execute(String args) =>
      _positionRepository.where((map) => map['instrumentId'] == args).then(
            (value) => [
              ...value.map(
                (e) => Position(
                  id: e.id,
                  count: e.count,
                  price: e.price,
                  date: e.date,
                ),
              )
            ],
          );
}
