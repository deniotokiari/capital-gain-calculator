import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_data/portfolio_data.dart';
import 'package:portfolio_details/src/bloc/portfolio_details_event.dart';
import 'package:portfolio_details/src/bloc/portfolio_details_state.dart';
import 'package:portfolio_details/src/model/portfolio_details_view_model.dart';
import 'package:portfolio_use_case/portfolio_use_case.dart';
import 'package:symbol_api/symbol_api.dart';

class PortfolioDetailsBloc extends Bloc<PortfolioDetailsEvent, PortfolioDetailsState> {
  final GetPortfolioInstrumentsUseCase _getPortfolioInstruments;
  final AddPortfolioSymbolUseCase _addPortfolioSymbolUseCase;
  final PortfolioRepository _portfolioRepository;

  late String _portfolioId;

  PortfolioDetailsBloc(
    this._getPortfolioInstruments,
    this._addPortfolioSymbolUseCase,
    this._portfolioRepository,
  ) : super(PortfolioDetailsState.idle(PortfolioDetailsViewModel.initial())) {
    on<PortfolioDetailsEventInit>((event, emit) async {
      _portfolioId = event.portfolioId;

      final instruments = await _getPortfolioInstruments.execute(_portfolioId);

      emit(
        state.copyWith(
          model: state.model.copyWith(
            portfolioName:
                await _portfolioRepository.getById(_portfolioId).then((value) => value.name),
            symbols: [
              ...instruments.map(
                success: (success) => success.data.map(
                  (e) => PortfolioDetailsSymbolViewModel.fromSymbolAndPhysicalCurrency(
                    e.symbol,
                    e.currency,
                  ),
                ),
                failed: (_) => [],
              )
            ],
          ),
        ),
      );
    });
    on<PortfolioDetailsEventAddSymbol>((event, emit) async {
      await _addPortfolioSymbolUseCase.execute(AddPortfolioSymbolArguments(
        portfolioId: _portfolioId,
        name: event.symbol.name,
        symbol: event.symbol.symbol,
        region: event.symbol.region,
        currency: event.symbol.currency,
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
