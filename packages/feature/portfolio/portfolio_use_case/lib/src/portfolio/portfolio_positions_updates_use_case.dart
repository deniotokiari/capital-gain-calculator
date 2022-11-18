import 'package:common/common.dart';
import 'package:db/db.dart' as db;

class PortfolioPositionsUpdatesUseCase
    implements
        UseCase<PortfolioPositionsUpdatesUseCaseArguments,
            Stream<PortfolioPositionsUpdatesUseCaseResult>> {
  final db.PositionRepository _positionRepository;
  final db.InstrumentRepository _instrumentRepository;

  PortfolioPositionsUpdatesUseCase(
    this._positionRepository,
    this._instrumentRepository,
  );

  @override
  Stream<PortfolioPositionsUpdatesUseCaseResult> execute(
      PortfolioPositionsUpdatesUseCaseArguments args) async* {
    final instruments = await _instrumentRepository.where(
      (map) => map['portfolioId'] == args.portfolioId,
    );
    final ids = instruments.map((e) => e.id);

    await for (final position in _positionRepository.stream()) {
      if (ids.contains(position.instrumentId)) {
        yield PortfolioPositionsUpdatesUseCaseResult();
      }
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
