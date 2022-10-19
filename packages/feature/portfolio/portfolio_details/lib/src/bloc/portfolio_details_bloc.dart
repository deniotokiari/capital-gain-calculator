import 'package:common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physical_currency/physical_currency.dart';
import 'package:portfolio_data/portfolio_data.dart';
import 'package:portfolio_details/src/bloc/portfolio_details_event.dart';
import 'package:portfolio_details/src/bloc/portfolio_details_state.dart';
import 'package:portfolio_details/src/model/portfolio_details_view_model.dart';
import 'package:symbol_api/symbol_api.dart';

class PortfolioDetailsBloc extends Bloc<PortfolioDetailsEvent, PortfolioDetailsState> {
  final PortfolioRepository _portfolioRepository;
  final SymbolRepository _symbolRepository;
  final PhysicalCurrencyListRepository _physicalCurrencyListRepository;
  final PortfolioInstrumentRepository _portfolioInstrumentRepository;

  late String _portfolioId;

  PortfolioDetailsBloc(
    this._portfolioRepository,
    this._symbolRepository,
    this._physicalCurrencyListRepository,
    this._portfolioInstrumentRepository,
  ) : super(PortfolioDetailsState.idle(PortfolioDetailsViewModel.initial())) {
    on<PortfolioDetailsEventInit>((event, emit) async {
      _portfolioId = event.portfolioId;

      final physicalCurrencyList = await _physicalCurrencyListRepository.getPhysicalCurrencyList();
      final portfolio = await _portfolioRepository.getById(_portfolioId);
      final instruments = await _portfolioInstrumentRepository.getByPortfolioId(_portfolioId);
      final symbols = await _symbolRepository.getItemsById(
        instruments.mapNotNull((e) => e.symbolId),
      );

      emit(state.copyWith(
          model: state.model.copyWith(
        portfolioName: portfolio.name,
        symbols: [
          ...symbols.map((e) => PortfolioDetailsSymbolViewModel.fromSymbol(
                e,
                physicalCurrencyList.firstWhere((element) => element.id == e.physicalCurrencyId),
              ))
        ],
      )));
    });
    on<PortfolioDetailsEventAddSymbol>((event, emit) async {
      // save symbol
      final physicalCurrency =
          await _physicalCurrencyListRepository.getByCurrencyCode(event.symbol.currency);
      final symbol = event.symbol.toSymbol(physicalCurrency.id);
      await _symbolRepository.add(symbol);

      // save instrument
      await _portfolioInstrumentRepository.add(PortfolioInstrument.symbol(
        portfolioId: _portfolioId,
        symbolId: symbol.id,
      ));

      final viewModelSymbol =
          PortfolioDetailsSymbolViewModel.fromSymbolSearchWidgetNavigationResult(event.symbol);

      if (state.model.symbols
          .where((element) =>
              element.symbol == viewModelSymbol.symbol && element.name == viewModelSymbol.name)
          .isEmpty) {
        emit(
          state.copyWith(
            model: state.model.copyWith(
              symbols: [
                ...state.model.symbols,
                viewModelSymbol,
              ],
            ),
          ),
        );
      }
    });
  }
}

extension SymbolSearchWidgetNavigationResultExt on SymbolSearchWidgetNavigationResult {
  Symbol toSymbol(String physicalCurrencyId) => Symbol(
        name: name,
        symbol: symbol,
        region: region,
        physicalCurrencyId: physicalCurrencyId,
      );
}
