import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_data/portfolio_data.dart';
import 'package:portfolio_details/src/bloc/portfolio_instrument_positions_event.dart';
import 'package:portfolio_details/src/bloc/portfolio_instrument_positions_state.dart';
import 'package:portfolio_use_case/portfolio_use_case.dart';

class PortfolioInstrumentPositionsBloc
    extends Bloc<PortfolioInstrumentPositionsEvent, PortfolioInstrumentPositionsState> {
  final GetPositionsByInstrumentIdUseCase _getPositionsByInstrumentIdUseCase;
  final InstrumentPositionsUpdatesUseCase _instrumentPositionsUpdatesUseCase;

  var _instrumentId = '';
  StreamSubscription<Position>? _subscription;

  PortfolioInstrumentPositionsBloc(
    this._getPositionsByInstrumentIdUseCase,
    this._instrumentPositionsUpdatesUseCase,
  ) : super(PortfolioInstrumentPositionsState.idle(
            PortfolioInstrumentPositionsViewModel.initial())) {
    on<PortfolioInstrumentPositionsEventInit>(
      (event, emit) async {
        _instrumentId = event.instrumentId;

        final positions = await _getPositionsByInstrumentIdUseCase.execute(event.instrumentId);

        _subscription ??= _instrumentPositionsUpdatesUseCase.execute(_instrumentId).listen((item) {
          add(PortfolioInstrumentPositionsEvent.init(_instrumentId));
        });

        emit(
          PortfolioInstrumentPositionsState.idle(
            PortfolioInstrumentPositionsViewModel.fromPositions(
              positions,
            ),
          ),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();

    return super.close();
  }
}
