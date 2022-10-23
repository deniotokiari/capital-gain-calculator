import 'package:common/common.dart';
import 'package:portfolio_data/portfolio_data.dart';

class GetPortfolioInstrumentPositionsUseCase extends UseCase<String, List<InstrumentPosition>> {
  final PortfolioInstrumentPositionRepository _portfolioInstrumentPositionRepository;

  GetPortfolioInstrumentPositionsUseCase(
    this._portfolioInstrumentPositionRepository,
  );

  @override
  Future<Result<List<InstrumentPosition>>> execute(String args) => runCatchingAsync(
        () async {
          final positions = await _portfolioInstrumentPositionRepository.getPositionsByInstrumentId(
            args,
          );

          return [...positions.map((e) => InstrumentPosition(e))];
        },
      );
}

class InstrumentPosition {
  final PortfolioInstrumentPosition position;

  InstrumentPosition(this.position);
}
