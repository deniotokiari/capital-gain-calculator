import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_data/portfolio_data.dart';
import 'package:portfolio_details/src/bloc/portfolio_instrument_positions_event.dart';
import 'package:portfolio_details/src/bloc/portfolio_instrument_positions_state.dart';
import 'package:portfolio_use_case/portfolio_use_case.dart';

class PortfolioInstrumentPositionsBloc
    extends Bloc<PortfolioInstrumentPositionsEvent, PortfolioInstrumentPositionsState> {
  final GetPortfolioInstrumentPositionsUseCase _getPortfolioInstrumentPositionsUseCase;
  final PortfolioInstrumentPositionRepository _instrumentPositionRepository;

  var _instrumentId = '';
  StreamSubscription<PortfolioInstrumentPosition>? _subscription;

  PortfolioInstrumentPositionsBloc(
    this._getPortfolioInstrumentPositionsUseCase,
    this._instrumentPositionRepository,
  ) : super(PortfolioInstrumentPositionsState.idle(
            PortfolioInstrumentPositionsViewModel.initial())) {
    on<PortfolioInstrumentPositionsEventInit>((event, emit) async {
      _instrumentId = event.instrumentId;
      final positions = await _getPortfolioInstrumentPositionsUseCase.execute(event.instrumentId);

      positions.map(
        success: (success) => emit(
          PortfolioInstrumentPositionsState.idle(
            PortfolioInstrumentPositionsViewModel.fromInstrumentPositions(
              success.data,
            ),
          ),
        ),
        failed: (_) {},
      );
    });

    _subscription = _instrumentPositionRepository.stream.listen((item) {
      add(PortfolioInstrumentPositionsEvent.init(_instrumentId));
    });
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();

    return super.close();
  }
}
