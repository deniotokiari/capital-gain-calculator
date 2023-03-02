import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_portfolio_state.freezed.dart';

@freezed
class CreatePortfolioState with _$CreatePortfolioState {
  factory CreatePortfolioState({
    required bool submitEnabled,
    required List<String>? listOfCurrency,
    required String? portfolioName,
    required String? selectedCurrency,
  }) = _CreatePortfolioState;

  factory CreatePortfolioState.initial() => CreatePortfolioState(
        listOfCurrency: null,
        portfolioName: null,
        selectedCurrency: null,
        submitEnabled: false,
      );
}
