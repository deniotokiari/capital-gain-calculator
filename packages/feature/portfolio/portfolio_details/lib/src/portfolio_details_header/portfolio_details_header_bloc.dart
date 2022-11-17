import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_details/src/portfolio_details_header/portfolio_details_header_event.dart';
import 'package:portfolio_details/src/portfolio_details_header/portfolio_details_header_state.dart';
import 'package:portfolio_details/src/portfolio_details_header/portfolio_details_header_view_model.dart';
import 'package:portfolio_use_case/portfolio_use_case.dart';

class PortfolioDetailsHeaderBloc
    extends Bloc<PortfolioDetailsHeaderEvent, PortfolioDetailsHeaderState> {
  late String _portfolioId;

  final GetPortfolioNameByIdUseCase _getPortfolioNameByIdUseCase;
  final GetPortfolioMarketValueUseCase _getPortfolioMarketValueUseCase;

  PortfolioDetailsHeaderBloc(
    this._getPortfolioNameByIdUseCase,
    this._getPortfolioMarketValueUseCase,
  ) : super(
          PortfolioDetailsHeaderState.loading(
            PortfolioDetailsHeaderViewModel.empty(),
          ),
        ) {
    on<PortfolioDetailsHeaderEventInit>((event, emit) async {
      _portfolioId = event.portfolioId;

      
    });
    on<PortfolioDetailsHeaderEventRefresh>((event, emit) {});
  }
}
