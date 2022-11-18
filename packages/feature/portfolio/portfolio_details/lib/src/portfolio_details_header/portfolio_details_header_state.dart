import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio_details/src/portfolio_details_header/portfolio_details_header_view_model.dart';

part 'portfolio_details_header_state.freezed.dart';

@freezed
class PortfolioDetailsHeaderState with _$PortfolioDetailsHeaderState {
  factory PortfolioDetailsHeaderState.idle(PortfolioDetailsHeaderViewModel viewModel) =
      _PortfolioDetailsHeaderStateIdle;
}
