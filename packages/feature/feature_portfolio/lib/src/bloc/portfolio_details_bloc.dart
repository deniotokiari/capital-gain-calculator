import 'package:data_portfolio/portfolio.dart';
import 'package:feature_portfolio/src/bloc/portfolio_details_event.dart';
import 'package:feature_portfolio/src/bloc/portfolio_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PortfolioDetailsBloc extends Bloc<PortfolioDetailsEvent, PortfolioDetailsState> {
  final PortfolioRepository _portfolioRepository;

  PortfolioDetailsBloc(
    this._portfolioRepository,
  ) : super(PortfolioDetailsState.loading()) {
    on<PortfolioDetailsEventInit>((event, emit) async {
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
  }
}
