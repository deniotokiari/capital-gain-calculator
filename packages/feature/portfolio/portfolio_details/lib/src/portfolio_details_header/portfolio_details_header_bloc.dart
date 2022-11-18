import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_details/src/portfolio_details_header/portfolio_details_header_event.dart';
import 'package:portfolio_details/src/portfolio_details_header/portfolio_details_header_state.dart';
import 'package:portfolio_details/src/portfolio_details_header/portfolio_details_header_view_model.dart';
import 'package:portfolio_use_case/portfolio_use_case.dart';

class PortfolioDetailsHeaderBloc
    extends Bloc<PortfolioDetailsHeaderEvent, PortfolioDetailsHeaderState> {
  late String _portfolioId;

  final GetPortfolioNameByIdUseCase _getPortfolioNameByIdUseCase;
  final GetPortfolioMarketValueReturnValueReturnPercentUseCase
      _getPortfolioMarketValueReturnValueReturnPercentUseCase;
  final GetQuotesByPortfolioIdUseCase _getQuotesByPortfolioIdUseCase;
  final PortfolioPositionsUpdatesUseCase _portfolioPositionsUpdatesUseCase;

  StreamSubscription<PortfolioPositionsUpdatesUseCaseResult>? _streamSubscription;

  PortfolioDetailsHeaderBloc(
    this._getPortfolioNameByIdUseCase,
    this._getPortfolioMarketValueReturnValueReturnPercentUseCase,
    this._getQuotesByPortfolioIdUseCase,
    this._portfolioPositionsUpdatesUseCase,
  ) : super(
          PortfolioDetailsHeaderState.idle(PortfolioDetailsHeaderViewModel.empty()),
        ) {
    on<PortfolioDetailsHeaderEventInit>((event, emit) async {
      _portfolioId = event.portfolioId;

      emit(PortfolioDetailsHeaderState.idle(await _getViewModel()));

      _streamSubscription = _portfolioPositionsUpdatesUseCase
          .execute(
        PortfolioPositionsUpdatesUseCaseArguments(
          portfolioId: _portfolioId,
        ),
      )
          .listen((_) {
        add(PortfolioDetailsHeaderEvent.update());
      });
    });
    on<PortfolioDetailsHeaderEventUpdate>((event, emit) async {
      emit(state.copyWith(viewModel: state.viewModel.copyWith(refreshing: true)));
      emit(PortfolioDetailsHeaderState.idle(await _getViewModel()));
    });
    on<PortfolioDetailsHeaderEventRefresh>((event, emit) async {
      emit(state.copyWith(viewModel: state.viewModel.copyWith(refreshing: true)));

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
    final values = await _getPortfolioMarketValueReturnValueReturnPercentUseCase.execute(
      GetPortfolioMarketValueReturnValueReturnPercentUseCaseArguments(
        portfolioId: _portfolioId,
      ),
    );

    return PortfolioDetailsHeaderViewModel.values(
      portfolioName: await _getPortfolioNameByIdUseCase.execute(_portfolioId),
      marketValue: values?.marketValue,
      returnValue: values?.returnValue,
      returnPercent: values?.returnPercent,
      refreshing: false,
      loading: false,
    );
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();

    return super.close();
  }
}
