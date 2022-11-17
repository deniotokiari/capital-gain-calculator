import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio_details/src/portfolio_details_header/portfolio_details_header_view_model.dart';

part 'portfolio_details_header_state.freezed.dart';

abstract class PortfolioDetailsHeaderStateViewModel {
  PortfolioDetailsHeaderViewModel get viewModel;
}

@freezed
class PortfolioDetailsHeaderState with _$PortfolioDetailsHeaderState {
  @Implements<PortfolioDetailsHeaderStateViewModel>()
  factory PortfolioDetailsHeaderState.idle(PortfolioDetailsHeaderViewModel viewModel) =
      _PortfolioDetailsHeaderStateIdle;

  @Implements<PortfolioDetailsHeaderStateViewModel>()
  factory PortfolioDetailsHeaderState.refreshing(PortfolioDetailsHeaderViewModel viewModel) =
      _PortfolioDetailsHeaderStateRefreshing;

  @Implements<PortfolioDetailsHeaderStateViewModel>()
  factory PortfolioDetailsHeaderState.loading(PortfolioDetailsHeaderViewModel viewModel) =
      PortfolioDetailsHeaderStateLoading;
}
