import 'package:common/common.dart';
import 'package:db/db.dart' as db;

class PortfolioPositionsUpdatesUseCase
    implements
        UseCase<PortfolioPositionsUpdatesUseCaseArguments,
            Stream<PortfolioPositionsUpdatesUseCaseResult>> {
  final db.PositionRepository _positionRepository;

  PortfolioPositionsUpdatesUseCase(
    this._positionRepository,
  );

  @override
  Stream<PortfolioPositionsUpdatesUseCaseResult> execute(
      PortfolioPositionsUpdatesUseCaseArguments args) async* {
    // ignore: unused_local_variable
    await for (final position in _positionRepository.stream()) {
      yield PortfolioPositionsUpdatesUseCaseResult();
    }
  }
}

class PortfolioPositionsUpdatesUseCaseArguments {
  final String portfolioId;

  PortfolioPositionsUpdatesUseCaseArguments({
    required this.portfolioId,
  });
}

class PortfolioPositionsUpdatesUseCaseResult {
  PortfolioPositionsUpdatesUseCaseResult();
}
