import 'dart:async';

import 'package:all_portfolios/src/bloc/all_portfolios_event.dart';
import 'package:all_portfolios/src/bloc/all_portfolios_state.dart';
import 'package:all_portfolios/src/model/all_portfolios_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_data/portfolio_data.dart';
import 'package:portfolio_use_case/portfolio_use_case.dart';

class AllPortfoliosBloc extends Bloc<AllPortfoliosEvent, AllPortfoliosState> {
  final GetAllPortfoliosUseCase _getAllPortfoliosUseCase;
  final PortfoliosUpdatesUseCase _portfoliosUpdatesUseCase;
  final GetPortfolioMarketValueReturnValueReturnPercentUseCase
      _getPortfolioMarketValueReturnValueReturnPercentUseCase;
  final ConvertPhysicalCurrencyUseCaseUseCase _convertPhysicalCurrencyUseCaseUseCase;

  StreamSubscription<Portfolio>? _streamSubscription;

  AllPortfoliosBloc(
    this._getAllPortfoliosUseCase,
    this._portfoliosUpdatesUseCase,
    this._getPortfolioMarketValueReturnValueReturnPercentUseCase,
    this._convertPhysicalCurrencyUseCaseUseCase,
  ) : super(
          AllPortfoliosState.idle(
            AllPortfoliosViewModel(
              portfolios: [],
              marketValue: null,
              returnValue: null,
              returnPercent: null,
            ),
          ),
        ) {
    on<AllPortfoliosEventInit>((event, emit) async {
      emit(await _getState());
    });
    on<AllPortfoliosEventRefresh>((event, emit) async {
      emit(await _getState());
    });

    _streamSubscription = _portfoliosUpdatesUseCase.execute(null).listen((_) {
      add(AllPortfoliosEvent.refresh());
    });
  }

  Future<AllPortfoliosState> _getState() async {
    final portfolios = await _getAllPortfoliosUseCase.execute(null);
    final models = <PortfolioViewModel>[];

    double marketValue = 0;
    double returnValue = 0;
    double invested = 0;

    for (final portfolio in portfolios) {
      final values = await _getPortfolioMarketValueReturnValueReturnPercentUseCase.execute(
        GetPortfolioMarketValueReturnValueReturnPercentUseCaseArguments(
          portfolioId: portfolio.id,
        ),
      );

      if (values != null) {
      }

      models.add(PortfolioViewModel(
        portfolioId: portfolio.id,
        name: portfolio.name,
        marketValue: values?.marketValue,
        returnValue: values?.returnValue,
        returnPercent: values?.returnPercent,
      ));
    }

    return AllPortfoliosState.idle(
      AllPortfoliosViewModel(
        portfolios: models,
        marketValue: null,
        returnValue: null,
        returnPercent: null,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();

    return super.close();
  }
}
