import 'package:common/common.dart';
import 'package:db/db.dart' as db;
import 'package:physical_currency/physical_currency.dart';
import 'package:portfolio_data/portfolio_data.dart';

class GetPositionsByInstrumentIdUseCase implements UseCase<String, Future<List<Position>>> {
  final db.PositionRepository _positionRepository;
  final GetPhysicalCurrencyByIdUseCase _getPhysicalCurrencyByIdUseCase;

  GetPositionsByInstrumentIdUseCase(
    this._positionRepository,
    this._getPhysicalCurrencyByIdUseCase,
  );

  @override
  Future<List<Position>> execute(String args) async {
    final positions = await _positionRepository.where((map) => map['instrumentId'] == args);
    final result = <Position>[];

    for (final item in positions) {
      result.add(Position(
        id: item.id,
        count: item.count,
        price: item.price,
        physicalCurrency: await _getPhysicalCurrencyByIdUseCase.execute(item.physicalCurrencyId),
        date: item.date,
      ));
    }

    return result;
  }
}
