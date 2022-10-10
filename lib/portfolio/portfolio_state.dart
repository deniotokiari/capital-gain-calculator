import 'package:capital_gain_calculator/portfolio/portfolio_repository.dart';
import 'package:capital_gain_calculator/search/search_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_state.freezed.dart';

@freezed
class PortfolioState with _$PortfolioState {
  factory PortfolioState.idle(
    Portfolio portfolio,
    List<PortfolioPositionViewModel> symbols,
  ) = _PortfolioStateIdle;
}

class PortfolioPositionViewModel {
  final String symbol;
  final String name;
  final String currency;
  final String region;
  final String type;

  PortfolioPositionViewModel({
    required this.symbol,
    required this.name,
    required this.currency,
    required this.region,
    required this.type,
  });

  factory PortfolioPositionViewModel.fromSearchResultItem(SearchResultItem item) =>
      PortfolioPositionViewModel(
        symbol: item.symbol,
        name: item.name,
        currency: item.currency,
        region: item.region,
        type: item.type,
      );
}
