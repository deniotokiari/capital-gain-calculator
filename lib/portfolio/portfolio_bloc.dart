import 'package:capital_gain_calculator/portfolio/portfolio_event.dart';
import 'package:capital_gain_calculator/portfolio/portfolio_repository.dart';
import 'package:capital_gain_calculator/portfolio/portfolio_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final Portfolio _portfolio;

  PortfolioBloc(
    this._portfolio,
  ) : super(PortfolioState.idle(_portfolio, [])) {
    on<PortfolioEventAddSymbol>(((event, emit) {
      emit(state.copyWith(symbols: [...state.symbols, event.item]));
    }));
  }
}
