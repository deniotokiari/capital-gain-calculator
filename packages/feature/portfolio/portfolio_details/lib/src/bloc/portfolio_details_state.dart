import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio_details/src/model/portfolio_details_view_model.dart';

part 'portfolio_details_state.freezed.dart';

@freezed
class PortfolioDetailsState with _$PortfolioDetailsState {
  factory PortfolioDetailsState.idle(PortfolioDetailsViewModel model) = _PortfolioDetailsStateIdle;
}
