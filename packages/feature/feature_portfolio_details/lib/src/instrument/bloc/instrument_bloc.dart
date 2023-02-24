import 'dart:async';

import 'package:data_market_value/data_market_value.dart';
import 'package:data_position/data_position.dart';
import 'package:feature_portfolio_details/src/instrument/bloc/instrument_event.dart';
import 'package:feature_portfolio_details/src/instrument/bloc/instrument_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/store.dart';
import 'package:usecase_portfolio_details/usecase_portfolio_details.dart';
import 'package:utility/utility.dart';

class InstrumentBloc extends Bloc<InstrumentEvent, InstrumentState> {
  final GetSymbolByInstrumentIdUseCase _getSymbolByInstrumentIdUseCase;
  final PositionRepository _positionRepository;

  late String _instrumentId;
  StreamSubscription? _streamSubscription;

  InstrumentBloc(
    this._getSymbolByInstrumentIdUseCase,
    this._positionRepository,
  ) : super(InstrumentState.loading()) {
    on<InstrumentEventInit>((event, emit) async {
      _instrumentId = event.instrumentId;

      await _update(event.instrumentId, emit);

      await _streamSubscription?.cancel();
      _streamSubscription = _positionRepository.updates([Query('instrument_id', isEqualTo: event.instrumentId)]).listen((event) {
        add(InstrumentEvent.update());
      });
    });
    on<InstrumentEventUpdate>((event, emit) async {
      await _update(_instrumentId, emit);
    });
  }

  Future<void> _update(String instrumentId, dynamic emit) async {
    final result = await _getSymbolByInstrumentIdUseCase.execute(
      GetSymbolByInstrumentIdUseCaseArguments(instrumentId: instrumentId),
    );
    final globalQuote = result.symbol.globalQuote;
    final positions = await _positionRepository.all([Query('instrument_id', isEqualTo: instrumentId)]);

    emit(InstrumentState.idle(
      InstrumentStateTitle(title: '${result.symbol.ticker} - ${result.symbol.name}'),
      InstrumentStatePositions([
        ...positions.map(
          (e) => InstrumentStatePositionsItem(
            _formatDate(e.date),
            globalQuote?.let((that) => MarketValue(count: e.count, current: that.close, invested: e.price)),
          ),
        )
      ]),
    ));
  }

  String _formatDate(DateTime date) => '${date.day}/${date.month}/${date.year}';

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();

    return super.close();
  }
}
