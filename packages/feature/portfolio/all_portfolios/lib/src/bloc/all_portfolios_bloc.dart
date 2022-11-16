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
  final GetInstrumentsByPortfolioId _getInstrumentsByPortfolioId;

  StreamSubscription<Portfolio>? _streamSubscription;

  AllPortfoliosBloc(
    this._getAllPortfoliosUseCase,
    this._portfoliosUpdatesUseCase,
    this._getInstrumentsByPortfolioId,
  ) : super(
          AllPortfoliosState.idle(
            AllPortfoliosViewModel(
              portfolios: [],
              marketValue: 0,
              returnValue: 0,
              returnPercent: 0,
            ),
          ),
        ) {
    on<AllPortfoliosEventInit>((event, emit) async {
      final portfolios = await _getAllPortfoliosUseCase.execute(null);
      final models = <PortfolioViewModel>[];

      for (var i = 0; i < portfolios.length; i++) {
        final instruments = await _getInstrumentsByPortfolioId.execute(portfolios[i].id);
        final marketPrice = instruments.fold<double>(
          0,
          (p, e) => p + e.lastPrice * e.count,
        );
        final returnValue = instruments.fold<double>(
          0,
          (p, e) => p + (e.count * e.lastPrice - e.invested),
        );
        final invested = instruments.fold<double>(
          0,
          (p, e) => p + e.invested,
        );
        final returnPercent = invested == 0 ? 0.0 : returnValue / invested;

        models.add(PortfolioViewModel(
          name: portfolios[i].name,
          currency: portfolios[i].physicalCurrency.sign,
          portfolioId: portfolios[i].id,
          marketValue: marketPrice,
          returnValue: returnValue,
          returnPercent: returnPercent,
        ));
      }

      final marketValue =
          models.fold<double>(0.0, (previousValue, element) => previousValue + element.marketValue);
      final returnValue =
          models.fold<double>(0.0, (previousValue, element) => previousValue + element.returnValue);
      final invested = marketValue - returnValue;
      final returnPercent = invested == 0 ? 0.0 : returnValue / invested;

      emit(AllPortfoliosState.idle(AllPortfoliosViewModel(
        marketValue: marketValue,
        returnValue: returnValue,
        returnPercent: returnPercent,
        portfolios: models,
      )));
    });

    _streamSubscription = _portfoliosUpdatesUseCase.execute(null).listen((_) {
      add(AllPortfoliosEvent.init());
    });
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();

    return super.close();
  }
}
