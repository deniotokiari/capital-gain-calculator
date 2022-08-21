import 'package:capital_gain_calculator/portfolio/create_portfolio_event.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_portfolio_state.freezed.dart';

@freezed
class CreatePortfolioState with _$CreatePortfolioState {
  factory CreatePortfolioState.idle({
    required bool submitEnabled,
    required List<Currency> listOfCurrency,
  }) = _CreatePortfolioStateIdle;
}
