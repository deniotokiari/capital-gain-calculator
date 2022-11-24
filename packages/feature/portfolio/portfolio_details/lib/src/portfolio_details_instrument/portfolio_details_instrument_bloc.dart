import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_details/src/portfolio_details_instrument/portfolio_details_instrument_event.dart';
import 'package:portfolio_details/src/portfolio_details_instrument/portfolio_details_instrument_state.dart';
import 'package:portfolio_details/src/portfolio_details_instrument/portfolio_details_instrument_view_model.dart';
import 'package:portfolio_use_case/portfolio_use_case.dart';

class PortfolioDetailsInstrumentBloc
    extends Bloc<PortfolioDetailsInstrumentEvent, PortfolioDetailsInstrumentState> {
  final GetInstrumentTickerUseCase _getInstrumentTickerUseCase;
  final GetInstrumentMarketValueReturnValueReturnPercentUseCase
      _getInstrumentMarketValueReturnValueReturnPercentUseCase;
  final InstrumentPositionsUpdatesUseCase _instrumentPositionsUpdatesUseCase;

  late String _instrumentId;
  final List<StreamSubscription<dynamic>> _streamSubscription = [];

  PortfolioDetailsInstrumentBloc(
    this._getInstrumentTickerUseCase,
    this._getInstrumentMarketValueReturnValueReturnPercentUseCase,
    this._instrumentPositionsUpdatesUseCase,
  ) : super(PortfolioDetailsInstrumentState.idle(PortfolioDetailsInstrumentViewModel.empty())) {
    on<PortfolioDetailsInstrumentEventInit>((event, emit) async {
      _instrumentId = event.instrumentId;

      emit(await _getState());

      _streamSubscription.add(
        _instrumentPositionsUpdatesUseCase.execute(_instrumentId).listen(
          (event) {
            add(PortfolioDetailsInstrumentEvent.refresh());
          },
        ),
      );
    });
    on<PortfolioDetailsInstrumentEventRefresh>((event, emit) async {
      emit(await _getState());
    });
  }

  Future<PortfolioDetailsInstrumentState> _getState() async {
    final ticker = await _getInstrumentTickerUseCase
        .execute(GetInstrumentTickerUseCaseArguments(instrumentId: _instrumentId))
        .then(
          (value) => value.ticker,
        );
    final values = await _getInstrumentMarketValueReturnValueReturnPercentUseCase.execute(
      GetInstrumentMarketValueReturnValueReturnPercentUseCaseArguments(
        instrumentId: _instrumentId,
      ),
    );

    return PortfolioDetailsInstrumentState.idle(
      PortfolioDetailsInstrumentViewModel(
        ticker: ticker,
        marketValue: values?.marketValue,
        returnValue: values?.returnValue,
        returnPercent: values?.returnPercent,
      ),
    );
  }

  @override
  Future<void> close() async {
    await Future.wait(_streamSubscription.map((e) => e.cancel()));

    return super.close();
  }
}
