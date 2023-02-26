import 'dart:async';

import 'package:data_instrument/data_instrument.dart';
import 'package:data_market_value/data_market_value.dart';
import 'package:data_portfolio/portfolio.dart';
import 'package:data_position/data_position.dart';
import 'package:feature_portfolio_details/src/header/bloc/portfolio_header_event.dart';
import 'package:feature_portfolio_details/src/header/bloc/portfolio_header_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/store.dart';

class PortfolioHeaderBloc extends Bloc<PortfolioHeaderEvent, PortfolioHeaderState> {
  final MarketValueRepository _marketValueRepository;
  final PortfolioRepository _portfolioRepository;
  final InstrumentRepository _instrumentRepository;
  final PositionRepository _positionRepository;

  late String _portfolioId;
  StreamSubscription? _streamSubscription;

  PortfolioHeaderBloc(
    this._marketValueRepository,
    this._portfolioRepository,
    this._instrumentRepository,
    this._positionRepository,
  ) : super(PortfolioHeaderState(
          title: null,
          marketValue: null,
        )) {
    on<PortfolioHeaderEventInit>((event, emit) async {
      final portfolio = await _portfolioRepository.get(event.porftolioId);

      _portfolioId = portfolio.id;

      emit(state.copyWith(title: portfolio.name));

      final instruments = await _instrumentRepository.all([Query('portfolio_id', isEqualTo: portfolio.id)]);

      await _streamSubscription?.cancel();

      if (instruments.isNotEmpty) {
        _streamSubscription = _positionRepository.updates([
          Query(
            'instrument_id',
            whereIn: [...instruments.map((e) => e.id)],
          )
        ]).listen((event) {
          add(PortfolioHeaderEvent.update());
        });
      }
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
    await _streamSubscription?.cancel();

    return super.close();
  }
}
