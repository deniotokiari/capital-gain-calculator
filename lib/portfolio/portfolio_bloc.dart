import 'package:capital_gain_calculator/portfolio/portfolio_event.dart';
import 'package:capital_gain_calculator/portfolio/portfolio_positions_repository.dart';
import 'package:capital_gain_calculator/portfolio/portfolio_repository.dart';
import 'package:capital_gain_calculator/portfolio/portfolio_state.dart';
import 'package:capital_gain_calculator/portfolio/symbol_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final PortfolioPositionsRepository _portfolioPositionsRepository;
  final SymbolRepository _symbolRepository;
  final Portfolio _portfolio;

  PortfolioBloc(
    this._portfolioPositionsRepository,
    this._symbolRepository,
    this._portfolio,
  ) : super(PortfolioState.idle(_portfolio, [])) {
    on<PortfolioEventInit>(((event, emit) async {
      final positions = await _portfolioPositionsRepository.getPositions(
        _portfolio.id,
      );
      final symbols = await _symbolRepository.getByIds(
        positions.map((e) => e.symbolId),
      );

      emit(PortfolioState.idle(
        _portfolio,
        symbols
            .map((e) => PortfolioPositionViewModel(
                  symbol: e.symbol,
                  name: e.name,
                  currency: e.currency,
                  region: e.region,
                  type: e.type,
                ))
            .toList(growable: false),
      ));
    }));
    on<PortfolioEventAddSymbol>(((event, emit) async {
      emit(state.copyWith(symbols: [
        ...state.symbols,
        PortfolioPositionViewModel.fromSearchResultItem(event.item),
      ]));

      final symbol = Symbol(
        symbol: event.item.symbol,
        name: event.item.name,
        type: event.item.type,
        region: event.item.region,
        currency: event.item.currency,
      );

      await _symbolRepository.add(symbol);
      await _portfolioPositionsRepository.add(PortfolioPosition(
        portfolioId: _portfolio.id,
        symbolId: symbol.id,
      ));
    }));
  }
}
