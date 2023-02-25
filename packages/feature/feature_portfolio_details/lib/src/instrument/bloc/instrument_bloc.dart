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
  final MarketValueRepository _marketValueRepository;

  late String _instrumentId;
  StreamSubscription? _streamSubscription;

  InstrumentBloc(
    this._getSymbolByInstrumentIdUseCase,
    this._positionRepository,
    this._marketValueRepository,
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
    on<InstrumentEventDeletePosition>((event, emit) async {
      await _positionRepository.delete(event.positionId);

      await _update(_instrumentId, emit);
    });
  }

  Future<void> _update(String instrumentId, dynamic emit) async {
    final result = await _getSymbolByInstrumentIdUseCase.execute(GetSymbolByInstrumentIdUseCaseArguments(instrumentId: instrumentId));
    final positions = await _positionRepository.all([Query('instrument_id', isEqualTo: instrumentId)]);
    final marketValues = await _marketValueRepository.getPositionsMarketValue(instrumentId);

    positions.sort((a, b) => a.date.compareTo(b.date));

    emit(InstrumentState.idle(
      InstrumentStateTitle(title: result.symbol.ticker, marketValue: await _marketValueRepository.getInstrumentMarketValue(instrumentId)),
      InstrumentStatePositions([
        for (var i = 0; i < positions.length; i++)
          InstrumentStatePositionsItem(
            id: positions[i].id,
            date: positions[i].date.ddMMYYYY,
            marketValue: marketValues[positions[i].id],
          ),
      ]),
    ));
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();

    return super.close();
  }
}
