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

  late String _portfolioId;

  PortfolioDetailsBloc(
    this._portfolioRepository,
    this._symbolRepository,
    this._physicalCurrencyListRepository,
  ) : super(PortfolioDetailsState.idle(PortfolioDetailsViewModel(
          '',
          [],
        ))) {
    on<PortfolioDetailsEventInit>((event, emit) async {
      _portfolioId = event.portfolioId;

      final portfolio = await _portfolioRepository.getById(_portfolioId);

      emit(state.copyWith(model: state.model.copyWith(portfolioName: portfolio.name)));
    });
    on<PortfolioDetailsEventAddSymbol>((event, emit) async {
      final physicalCurrency =
          await _physicalCurrencyListRepository.getByCurrencyCode(event.symbol.currency);
      await _symbolRepository.add(event.symbol.toSymbol(physicalCurrency.id));

      emit(
        state.copyWith(
          model: state.model.copyWith(
            symbols: [
              ...state.model.symbols,
              PortfolioDetailsSymbolViewModel.fromSymbolSearchWidgetNavigationResult(event.symbol),
            ],
          ),
        ),
      );
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
