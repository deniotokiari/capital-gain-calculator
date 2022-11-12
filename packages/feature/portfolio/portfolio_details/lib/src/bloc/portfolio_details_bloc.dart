import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_details/src/bloc/portfolio_details_event.dart';
import 'package:portfolio_details/src/bloc/portfolio_details_state.dart';
import 'package:portfolio_details/src/model/portfolio_details_view_model.dart';
import 'package:portfolio_use_case/portfolio_use_case.dart';
import 'package:symbol_api/symbol_api.dart';

class PortfolioDetailsBloc extends Bloc<PortfolioDetailsEvent, PortfolioDetailsState> {
  final AddSymbolInstrumentUseCase _addSymbolInstrumentUseCase;
  final GetPortfolioNameByIdUseCase _getPortfolioNameByIdUseCase;
  final GetInstrumentsByPortfolioId _getInstrumentsByPortfolioId;
  final GetQuotesByPortfolioIdUseCase _getQuotesByPortfolioIdUseCase;

  late String _portfolioId;

  PortfolioDetailsBloc(
    this._addSymbolInstrumentUseCase,
    this._getPortfolioNameByIdUseCase,
    this._getInstrumentsByPortfolioId,
    this._getQuotesByPortfolioIdUseCase,
  ) : super(PortfolioDetailsState.idle(PortfolioDetailsViewModel.initial())) {
    on<PortfolioDetailsEventInit>((event, emit) async {
      _portfolioId = event.portfolioId;
      await _getQuotesByPortfolioIdUseCase.execute(GetQuotesByPortfolioIdUseCaseArguments(
        portfolioId: _portfolioId,
        force: false,
      ));

      emit(await _getState());
    });
    on<PortfolioDetailsEventAddSymbol>((event, emit) async {
      await _addSymbolInstrumentUseCase.execute(AddSymbolInstrumentUseCaseArguments(
        portfolioId: _portfolioId,
        name: event.symbol.name,
        ticker: event.symbol.symbol,
        region: event.symbol.region,
        currency: event.symbol.currency,
      ));

      emit(await _getState());
    });
  }

  Future<PortfolioDetailsState> _getState() async {
    final instruments = await _getInstrumentsByPortfolioId.execute(_portfolioId);
    final List<String> tickers = [...instruments.map((e) => e.symbol!.ticker)];

    return state.copyWith(
      model: state.model.copyWith(
        tickers: tickers,
        portfolioName: await _getPortfolioNameByIdUseCase.execute(_portfolioId),
        symbols: [
          ...instruments.map(
            (e) => PortfolioDetailsSymbolViewModel.fromInstrument(e),
          )
        ],
      ),
    );
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
