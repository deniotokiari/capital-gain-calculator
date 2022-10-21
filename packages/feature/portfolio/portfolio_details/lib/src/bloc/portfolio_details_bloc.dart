import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_data/portfolio_data.dart';
import 'package:portfolio_details/src/bloc/portfolio_details_event.dart';
import 'package:portfolio_details/src/bloc/portfolio_details_state.dart';
import 'package:portfolio_details/src/model/portfolio_details_view_model.dart';
import 'package:portfolio_use_case/portfolio_use_case.dart';
import 'package:symbol_api/symbol_api.dart';

class PortfolioDetailsBloc extends Bloc<PortfolioDetailsEvent, PortfolioDetailsState> {
  final GetPortfolioInstrumentsUseCase _getPortfolioInstrumentsUseCase;
  final AddPortfolioSymbolUseCase _addPortfolioSymbolUseCase;
  final PortfolioRepository _portfolioRepository;

  late String _portfolioId;

  PortfolioDetailsBloc(
    this._getPortfolioInstrumentsUseCase,
    this._addPortfolioSymbolUseCase,
    this._portfolioRepository,
  ) : super(PortfolioDetailsState.idle(PortfolioDetailsViewModel.initial())) {
    on<PortfolioDetailsEventInit>((event, emit) async {
      _portfolioId = event.portfolioId;

      emit(await _getState());
    });
    on<PortfolioDetailsEventAddSymbol>((event, emit) async {
      await _addPortfolioSymbolUseCase.execute(AddPortfolioSymbolArguments(
        portfolioId: _portfolioId,
        name: event.symbol.name,
        symbol: event.symbol.symbol,
        region: event.symbol.region,
        currency: event.symbol.currency,
      ));

      emit(await _getState());
    });
  }

  Future<PortfolioDetailsState> _getState() async {
    final instruments = await _getPortfolioInstrumentsUseCase.execute(_portfolioId);
    final List<String> tickers = instruments.map(
      success: (success) => [...success.data.map((e) => e.symbol.symbol)],
      failed: (_) => [],
    );

    return state.copyWith(
      model: state.model.copyWith(
        tickers: tickers,
        portfolioName: await _portfolioRepository.getById(_portfolioId).then((value) => value.name),
        symbols: [
          ...instruments.map(
            success: (success) => success.data.map(
              (e) => PortfolioDetailsSymbolViewModel.fromSymbolAndPhysicalCurrency(
                e.symbol,
                e.instrumentId,
                e.currency,
              ),
            ),
            failed: (_) => [],
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
