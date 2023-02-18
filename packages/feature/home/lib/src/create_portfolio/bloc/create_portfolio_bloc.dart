import 'package:currency/currency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/src/create_portfolio/bloc/create_portfolio_event.dart';
import 'package:home/src/create_portfolio/bloc/create_portfolio_state.dart';
import 'package:portfolio/portfolio.dart';

class CreatePortfolioBloc extends Bloc<CreatePortfolioEvent, CreatePortfolioState> {
  final CurrencyListRepository _currencyListRepository;
  final PortfolioRepository _portfolioRepository;

  final List<Currency> _listOfCurrency = [];

  CreatePortfolioBloc(
    this._currencyListRepository,
    this._portfolioRepository,
  ) : super(CreatePortfolioState.initial()) {
    on<CreatePortfolioEventInit>((event, emit) async {
      _listOfCurrency.clear();

      final listOfCurrency = await _currencyListRepository.getCurrencyList();

      _listOfCurrency.addAll(listOfCurrency);

      emit(state.copyWith(
        listOfCurrency: _listOfCurrency.map(_formatCurrency).toList(growable: false),
        selectedCurrency: _formatCurrency(_listOfCurrency.firstWhere((e) => e.isUsd)),
      ));
    });
    on<CreatePortfolioEventOnPortfolioNameChanged>((event, emit) {
      emit(state.copyWith(portfolioName: event.name, submitEnabled: _submitState()));
    });
    on<CreatePortfolioEventOnPortfolioCurrencyChanged>((event, emit) {
      emit(state.copyWith(selectedCurrency: event.currency, submitEnabled: _submitState()));
    });
    on<CreatePortfolioEventOnSubmit>((event, emit) async {
      await _portfolioRepository.add(
        Portfolio(
          state.portfolioName!,
          _listOfCurrency.firstWhere((element) => state.selectedCurrency!.contains(element.code)),
        ),
      );
    });
  }

  bool _submitState() {
    final portfolioName = state.portfolioName;
    final currency = state.selectedCurrency;

    return portfolioName != null && portfolioName.isNotEmpty && currency != null && currency.isNotEmpty;
  }

  String _formatCurrency(Currency currency) => '${currency.name} (${currency.code})';
}
