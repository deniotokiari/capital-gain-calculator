import 'package:collection/collection.dart';
import 'package:create_portfolio/src/bloc/create_portfolio_event.dart';
import 'package:create_portfolio/src/bloc/create_portfolio_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physical_currency/physical_currency.dart';

class CreatePortfolioBloc extends Bloc<CreatePortfolioEvent, CreatePortfolioState> {
  final PhysicalCurrencyListRepository _physicalCurrencyListRepository;

  CreatePortfolioBloc(this._physicalCurrencyListRepository)
      : super(CreatePortfolioState.idle(
          submitEnabled: false,
          listOfCurrency: [],
          portfolioName: '',
          selectedCurrency: null,
        )) {
    on<CreatePortfolioEventInit>((event, emit) async {
      final listOfCurrency = await _physicalCurrencyListRepository.getPhysicalCurrencyList();

      emit(state.copyWith(
        listOfCurrency: listOfCurrency,
        selectedCurrency: listOfCurrency.firstWhereOrNull((e) => e.isUsd),
      ));
    });

    
  }
}
