import 'package:capital_gain_calculator/portfolio/portfolio_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_state.freezed.dart';

@freezed
class PortfolioState with _$PortfolioState {
  factory PortfolioState.idle(
    Portfolio? portfolio,
    List<Symbol> symbols,
  ) = _PortfolioStateIdle;
}
