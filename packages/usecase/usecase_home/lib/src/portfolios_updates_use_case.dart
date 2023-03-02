import 'dart:async';

import 'package:data_portfolio/portfolio.dart';
import 'package:data_position/data_position.dart';
import 'package:data_symbol/data_symbol.dart';
import 'package:utility/utility.dart';

class PortfoliosUpdatesUseCase extends UseCase<PortfoliosUpdatesUseCaseArguments, Stream<PortfoliosUpdatesUseCaseResult>> {
  final PortfolioRepository _portfolioRepository;
  final PositionRepository _positionRepository;
  final SymbolRepository _symbolRepository;

  PortfoliosUpdatesUseCase(
    this._portfolioRepository,
    this._positionRepository,
    this._symbolRepository,
  );

  @override
  Stream<PortfoliosUpdatesUseCaseResult> execute(PortfoliosUpdatesUseCaseArguments arg) {
    final subscriptions = <StreamSubscription>[];

    final streamController = StreamController<PortfoliosUpdatesUseCaseResult>(
      onCancel: () async {
        for (final item in subscriptions) {
          await item.cancel();
        }
      },
    );

    subscriptions.add(_portfolioRepository.getUpdates().listen((event) {
      streamController.add(PortfoliosUpdatesUseCaseResult());
    }));
    subscriptions.add(_positionRepository.getUpdates().listen((event) {
      streamController.add(PortfoliosUpdatesUseCaseResult());
    }));
    subscriptions.add(_symbolRepository.getUpdates().listen((event) {
      streamController.add(PortfoliosUpdatesUseCaseResult());
    }));

    return streamController.stream;
  }
}

class PortfoliosUpdatesUseCaseArguments {}

class PortfoliosUpdatesUseCaseResult {}
