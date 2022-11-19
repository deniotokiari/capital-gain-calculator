import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_details/src/portfolio_details_instrument/portfolio_details_instrument_view_model.dart';
import 'package:portfolio_use_case/portfolio_use_case.dart';

class PortfolioDetailsInstrumentCubit extends Cubit<PortfolioDetailsInstrumentViewModel> {
  final GetInstrumentTickerUseCase _getInstrumentTickerUseCase;
  final GetInstrumentMarketValueReturnValueReturnPercentUseCase
      _getInstrumentMarketValueReturnValueReturnPercentUseCase;
  final InstrumentPositionsUpdatesUseCase _instrumentPositionsUpdatesUseCase;

  StreamSubscription<dynamic> _streamSubscription;

  PortfolioDetailsInstrumentCubit(
    this._getInstrumentTickerUseCase,
    this._getInstrumentMarketValueReturnValueReturnPercentUseCase,
    this._instrumentPositionsUpdatesUseCase,
  ) : super(PortfolioDetailsInstrumentViewModel.empty());

  Future<void> init(String instrumentId) async {
    final ticker = await _getInstrumentTickerUseCase
        .execute(GetInstrumentTickerUseCaseArguments(instrumentId: instrumentId))
        .then(
          (value) => value.ticker,
        );
    final values = await _getInstrumentMarketValueReturnValueReturnPercentUseCase.execute(
      GetInstrumentMarketValueReturnValueReturnPercentUseCaseArguments(
        instrumentId: instrumentId,
      ),
    );

    emit(PortfolioDetailsInstrumentViewModel(
      ticker: ticker,
      marketValue: values?.marketValue,
      returnValue: values?.returnValue,
      returnPercent: values?.returnPercent,
    ));

    await _streamSubscription?.cancel();
    _streamSubscription =
        _instrumentPositionsUpdatesUseCase.execute(instrumentId).listen((event) {
          
        });
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
