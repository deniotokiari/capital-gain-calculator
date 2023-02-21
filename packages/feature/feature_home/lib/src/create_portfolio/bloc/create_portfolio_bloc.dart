import 'package:data_currency/currency.dart';
import 'package:data_portfolio/portfolio.dart';
import 'package:feature_home/src/create_portfolio/bloc/create_portfolio_event.dart';
import 'package:feature_home/src/create_portfolio/bloc/create_portfolio_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      emit(state.copyWith(portfolioName: event.name, submitEnabled: _submitState(name: event.name, currency: state.selectedCurrency)));
    });
    on<CreatePortfolioEventOnPortfolioCurrencyChanged>((event, emit) {
      emit(state.copyWith(
        selectedCurrency: event.currency,
        submitEnabled: _submitState(
          name: state.portfolioName,
          currency: event.currency,
        ),
      ));
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

  bool _submitState({required String? name, required String? currency}) {
    return name != null && name.isNotEmpty && currency != null && currency.isNotEmpty;
  }

  String _formatCurrency(Currency currency) => '${currency.name} (${currency.code})';
}
