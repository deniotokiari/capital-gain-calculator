import 'package:common/common.dart';
import 'package:portfolio_use_case/src/position/get_positions_by_instrument_id_use_case.dart';

class GetInstrumentAveragePriceUseCase implements UseCase<String, Future<double>> {
  final GetPositionsByInstrumentIdUseCase _getPositionsByInstrumentIdUseCase;

  GetInstrumentAveragePriceUseCase(
    this._getPositionsByInstrumentIdUseCase,
  );

  @override
  Future<double> execute(String args) async {
    final instruments = await _getPositionsByInstrumentIdUseCase.execute(args);
    final count = instruments.fold<double>(
      0,
      (previousValue, element) => previousValue + element.count,
    );
    final price = instruments.fold<double>(
      0,
      (previousValue, element) => previousValue + element.price.value,
    );

    return price / count;
  }
}
