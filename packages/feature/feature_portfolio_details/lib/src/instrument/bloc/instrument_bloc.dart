import 'package:feature_portfolio_details/src/instrument/bloc/instrument_event.dart';
import 'package:feature_portfolio_details/src/instrument/bloc/instrument_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usecase_portfolio_details/usecase_portfolio_details.dart';

class InstrumentBloc extends Bloc<InstrumentEvent, InstrumentState> {
  final GetSymbolByInstrumentIdUseCase _getSymbolByInstrumentIdUseCase;

  InstrumentBloc(
    this._getSymbolByInstrumentIdUseCase,
  ) : super(InstrumentState.loading()) {
    on<InstrumentEventInit>((event, emit) async {
      final result = await _getSymbolByInstrumentIdUseCase.execute(
        GetSymbolByInstrumentIdUseCaseArguments(instrumentId: event.instrumentId),
      );

      emit(InstrumentState.idle(
        InstrumentStateTitle(title: '${result.symbol.ticker} - ${result.symbol.name}'),
        InstrumentStatePositions(),
      ));
    });
  }
}
