import 'package:data_market_value/data_market_value.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_header_state.freezed.dart';

@freezed
class PortfolioHeaderState with _$PortfolioHeaderState {
  factory PortfolioHeaderState({
    required String? title,
    required MarketValue? marketValue,
  }) = _PortfolioHeaderState;
}
