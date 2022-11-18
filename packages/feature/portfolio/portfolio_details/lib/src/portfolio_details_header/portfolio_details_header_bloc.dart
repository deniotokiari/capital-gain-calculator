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
  final GetQuotesByPortfolioIdUseCase _getQuotesByPortfolioIdUseCase;

  PortfolioDetailsHeaderBloc(
    this._getPortfolioNameByIdUseCase,
    this._getPortfolioMarketValueUseCase,
    this._getQuotesByPortfolioIdUseCase,
  ) : super(
          PortfolioDetailsHeaderState.loading(
            PortfolioDetailsHeaderViewModel.empty(),
          ),
        ) {
    on<PortfolioDetailsHeaderEventInit>((event, emit) async {
      _portfolioId = event.portfolioId;

      emit(PortfolioDetailsHeaderState.idle(await _getViewModel()));
    });
    on<PortfolioDetailsHeaderEventRefresh>((event, emit) async {
      emit(PortfolioDetailsHeaderState.refreshing(state.viewModel));

      await _getQuotesByPortfolioIdUseCase.execute(
        GetQuotesByPortfolioIdUseCaseArguments(
          portfolioId: _portfolioId,
          force: true,
        ),
      );

      emit(PortfolioDetailsHeaderState.idle(await _getViewModel()));
    });
  }

  Future<PortfolioDetailsHeaderViewModel> _getViewModel() async {
    final marketValue = await _getPortfolioMarketValueUseCase.execute(
      GetPortfolioMarketValueUseCaseArguments(
        portfolioId: _portfolioId,
      ),
    );

    return PortfolioDetailsHeaderViewModel.model(
      portfolioName: await _getPortfolioNameByIdUseCase.execute(_portfolioId),
      marketValue: marketValue.value,
      returnValue: marketValue.value,
      returnPercent: 0,
    );
  }
}
