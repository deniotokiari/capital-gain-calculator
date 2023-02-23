import 'package:data_portfolio/portfolio.dart';
import 'package:feature_portfolio_details/src/bloc/portfolio_details_event.dart';
import 'package:feature_portfolio_details/src/bloc/portfolio_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usecase_portfolio_details/usecase_portfolio_details.dart';

class PortfolioDetailsBloc extends Bloc<PortfolioDetailsEvent, PortfolioDetailsState> {
  final PortfolioRepository _portfolioRepository;
  final AddSymbolToPortfolioUseCase _addSymbolToPortfolioUseCase;

  late String _portfolioId;

  PortfolioDetailsBloc(
    this._portfolioRepository,
    this._addSymbolToPortfolioUseCase,
  ) : super(PortfolioDetailsState.loading()) {
    on<PortfolioDetailsEventInit>((event, emit) async {
      _portfolioId = event.id;
      Portfolio? portfolio;

      try {
        portfolio = await _portfolioRepository.get(event.id);
      } catch (_) {
        // NOP
      }

      if (portfolio == null) {
        emit(PortfolioDetailsState.error('Portfolio with id "${event.id}" not found'));
      } else {
        emit(
          PortfolioDetailsState.idle(
            PortfolioDetailsViewModel(
              portfolioName: portfolio.name,
            ),
          ),
        );
      }
    });
    on<PortfolioDetailsEventAddSymbol>((event, emit) async {
      await _addSymbolToPortfolioUseCase.execute(AddSymbolToPortfolioUseCaseArguments(
        portfolioId: _portfolioId,
        symbol: event.symbol,
      ));
    });
  }
}
