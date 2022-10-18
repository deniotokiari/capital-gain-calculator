import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_details_state.freezed.dart';

@freezed
class PortfolioDetailsState with _$PortfolioDetailsState {
  factory PortfolioDetailsState.idle() = _PortfolioDetailsStateIdle;
}
