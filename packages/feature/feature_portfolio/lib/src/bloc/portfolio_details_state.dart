import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_details_state.freezed.dart';

@freezed
class PortfolioDetailsState with _$PortfolioDetailsState {
  factory PortfolioDetailsState.loading() = _PortfolioDetailsStateLoading;

  factory PortfolioDetailsState.error(String message) = _PortfolioDetailsStateError;

  factory PortfolioDetailsState.idle(PortfolioDetailsViewModel model) = _PortfolioDetailsStateIdle;
}

class PortfolioDetailsViewModel {
  final String portfolioName;

  PortfolioDetailsViewModel({
    required this.portfolioName,
  });
}
