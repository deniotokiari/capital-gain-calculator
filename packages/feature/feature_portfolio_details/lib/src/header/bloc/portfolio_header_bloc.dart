import 'dart:async';

import 'package:data_market_value/data_market_value.dart';
import 'package:data_portfolio/portfolio.dart';
import 'package:data_position/data_position.dart';
import 'package:feature_portfolio_details/src/header/bloc/portfolio_header_event.dart';
import 'package:feature_portfolio_details/src/header/bloc/portfolio_header_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PortfolioHeaderBloc extends Bloc<PortfolioHeaderEvent, PortfolioHeaderState> {
  final MarketValueRepository _marketValueRepository;
  final PortfolioRepository _portfolioRepository;
  final PositionRepository _positionRepository;

  late String _portfolioId;
  StreamSubscription? _postionsStreamSubscription;

  PortfolioHeaderBloc(
    this._marketValueRepository,
    this._portfolioRepository,
    this._positionRepository,
  ) : super(PortfolioHeaderState(
          title: null,
          marketValue: null,
        )) {
    on<PortfolioHeaderEventInit>((event, emit) async {
      final portfolio = _portfolioRepository.getById(event.porftolioId);

      _portfolioId = portfolio.id;

      emit(state.copyWith(title: portfolio.name));

      await _postionsStreamSubscription?.cancel();

      _postionsStreamSubscription = _positionRepository.getUpdates().listen((event) {
        add(PortfolioHeaderEvent.update());
      });

      await _update(_portfolioId, emit);
    });
    on<PortfolioHeaderEventUpdate>((event, emit) async {
      await _update(_portfolioId, emit);
    });
  }

  Future<void> _update(String portfolioId, dynamic emit) async {
    final marketValue = await _marketValueRepository.getPortfolioMarketValue(portfolioId);

    emit(state.copyWith(marketValue: marketValue));
  }

  @override
  Future<void> close() async {
    await _postionsStreamSubscription?.cancel();

    return super.close();
  }
}
