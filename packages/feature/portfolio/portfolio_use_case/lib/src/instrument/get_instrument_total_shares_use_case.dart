import 'package:common/common.dart';
import 'package:portfolio_use_case/src/position/get_positions_by_instrument_id_use_case.dart';

class GetInstrumentTotalSharesUseCase implements UseCase<String, Future<double>> {
  final GetPositionsByInstrumentIdUseCase _getPositionsByInstrumentIdUseCase;

  GetInstrumentTotalSharesUseCase(this._getPositionsByInstrumentIdUseCase);

  @override
  Future<double> execute(String args) async {
    final positions = await _getPositionsByInstrumentIdUseCase.execute(args);

    return positions.fold<double>(
      0,
      (previousValue, element) => previousValue + element.count,
    );
  }
}
