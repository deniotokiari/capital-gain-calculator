import 'package:collection/collection.dart';
import 'package:common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physical_currency/physical_currency.dart';
import 'package:portfolio_create/src/bloc/create_portfolio_event.dart';
import 'package:portfolio_create/src/bloc/create_portfolio_state.dart';
import 'package:portfolio_use_case/portfolio_use_case.dart';

class CreatePortfolioBloc extends Bloc<CreatePortfolioEvent, CreatePortfolioState> {
  final GetPhysicalCurrencyListUseCase _getPhysicalCurrencyListUseCase;
  final CreatePortfolioUseCase _createPortfolioUseCase;

  CreatePortfolioBloc(
    this._getPhysicalCurrencyListUseCase,
    this._createPortfolioUseCase,
  ) : super(CreatePortfolioState.idle(
          submitEnabled: false,
          listOfCurrency: [],
          portfolioName: '',
          selectedCurrency: null,
        )) {
    on<CreatePortfolioEventInit>((event, emit) async {
      final listOfCurrency = await _getPhysicalCurrencyListUseCase.execute(null);

      emit(state.copyWith(
        listOfCurrency: listOfCurrency,
        selectedCurrency: listOfCurrency.firstWhereOrNull((e) => e.isUsd),
      ));
    });
    on<CreatePortfolioEventCurrencySelected>((event, emit) {
      emit(state.copyWith(selectedCurrency: event.currency));
    });
    on<CreatePortfolioEventPortfolioNameChanged>((event, emit) {
      final portfolioName = event.getPortfolioName();

      emit(state.copyWith(
        portfolioName: portfolioName,
        submitEnabled: portfolioName.isNotEmpty,
      ));
    });
    on<CreatePortfolioEventSubmit>((event, emit) async {
      await _createPortfolioUseCase.execute(CreatePortfolioUseCaseArguments(
        name: state.portfolioName,
        physicalCurrency: state.selectedCurrency.require,
      ));
    });
  }
}
