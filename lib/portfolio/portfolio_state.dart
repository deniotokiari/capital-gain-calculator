import 'package:capital_gain_calculator/portfolio/portfolio_repository.dart';
import 'package:capital_gain_calculator/search/search_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_state.freezed.dart';

@freezed
class PortfolioState with _$PortfolioState {
  factory PortfolioState.idle(
    Portfolio portfolio,
    List<SearchResultItem> symbols,
  ) = _PortfolioStateIdle;
}
