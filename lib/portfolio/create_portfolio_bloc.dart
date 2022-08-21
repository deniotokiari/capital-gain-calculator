import 'package:capital_gain_calculator/portfolio/create_portfolio_event.dart';
import 'package:capital_gain_calculator/portfolio/create_portfolio_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_service/stock_service.dart';
import 'package:collection/collection.dart';

class CreatePortfolioBloc extends Bloc<CreatePortfolioEvent, CreatePortfolioState> {
  final PhysicalCurrencyListRepository _physicalCurrencyListRepository;

  CreatePortfolioBloc(this._physicalCurrencyListRepository)
      : super(
          CreatePortfolioState.idle(
            submitEnabled: false,
            selectedCurrency: null,
            listOfCurrency: [],
            portfolioName: '',
          ),
        ) {
    on<CreatePortfolioEventInit>((event, emit) async {
      final listOfCurrency = await _physicalCurrencyListRepository.getPhysicalCurrencyList();

      emit(CreatePortfolioState.idle(
        submitEnabled: state.submitEnabled,
        selectedCurrency: listOfCurrency.firstWhereOrNull((e) => e.isUsd),
        listOfCurrency: listOfCurrency,
        portfolioName: state.portfolioName,
      ));
    });
    on<CreatePortfolioEventCurrencySelected>((event, emit) {
      emit(CreatePortfolioState.idle(
        submitEnabled: state.submitEnabled,
        listOfCurrency: state.listOfCurrency,
        portfolioName: state.portfolioName,
        selectedCurrency: event.currency,
      ));
    });
    on<CreatePortfolioEventPortfolioNameChanged>((event, emit) {
      final portfolioName = event.portfolioName.trim();

      emit(CreatePortfolioState.idle(
        submitEnabled: portfolioName.isNotEmpty,
        selectedCurrency: state.selectedCurrency,
        listOfCurrency: state.listOfCurrency,
        portfolioName: portfolioName,
      ));
    });
    on<CreatePortfolioEventSubmit>((event, emit) {
      // TODO create portfolio
    });
  }
}
