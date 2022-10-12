import 'dart:async';

import 'package:all_portfolios/src/bloc/all_portfolios_event.dart';
import 'package:all_portfolios/src/bloc/all_portfolios_state.dart';
import 'package:all_portfolios/src/model/all_portfolios_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physical_currency/physical_currency.dart';
import 'package:portfolio_data/portfolio_data.dart';

class AllPortfoliosBloc extends Bloc<AllPortfoliosEvent, AllPortfoliosState> {
  final PortfolioRepository _portfolioRepository;
  final PhysicalCurrencyListRepository _physicalCurrencyListRepository;

  StreamSubscription<Portfolio>? _streamSubscription;

  AllPortfoliosBloc(
    this._portfolioRepository,
    this._physicalCurrencyListRepository,
  ) : super(
          AllPortfoliosState.idle(AllPortfoliosViewModel([])),
        ) {
    on<AllPortfoliosEventInit>((event, emit) async {
      final portfolios = await _portfolioRepository.getAll();
      final currencyList = await _physicalCurrencyListRepository.getPhysicalCurrencyList();

      emit(AllPortfoliosState.idle(AllPortfoliosViewModel([
        ...portfolios.map((portfolio) => PortfolioViewModel(
              name: portfolio.name,
              currency: currencyList
                  .firstWhere((currency) => currency.id == portfolio.physicalCurrencyId)
                  .code,
            ))
      ])));
    });

    _streamSubscription = _portfolioRepository.stream.listen((event) {
      add(AllPortfoliosEvent.init());
    });
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();

    return super.close();
  }
}
