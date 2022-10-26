import 'package:collection/collection.dart';
import 'package:common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physical_currency/physical_currency.dart';
import 'package:portfolio_create/src/bloc/create_portfolio_event.dart';
import 'package:portfolio_create/src/bloc/create_portfolio_state.dart';
import 'package:portfolio_data/portfolio_data.dart';

class CreatePortfolioBloc extends Bloc<CreatePortfolioEvent, CreatePortfolioState> {
  final GetPhysicalCurrencyListUseCase _getPhysicalCurrencyListUseCase;
  final PortfolioRepository _portfolioRepository;

  CreatePortfolioBloc(
    this._getPhysicalCurrencyListUseCase,
    this._portfolioRepository,
  ) : super(CreatePortfolioState.idle(
          submitEnabled: false,
          listOfCurrency: [],
          portfolioName: '',
          selectedCurrency: null,
        )) {
    on<CreatePortfolioEventInit>((event, emit) async {
      final listOfCurrency = await _getPhysicalCurrencyListUseCase.execute(null);

      emit(state.copyWith(
        listOfCurrency: listOfCurrency.requireValue,
        selectedCurrency: listOfCurrency.requireValue.firstWhereOrNull((e) => e.isUsd),
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
      await _portfolioRepository.add(Portfolio(
        name: state.portfolioName,
        physicalCurrencyId: state.selectedCurrency.require.id,
      ));
    });
  }
}
