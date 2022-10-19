import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:symbol_api/symbol_api.dart';

part 'portfolio_details_view_model.freezed.dart';

@freezed
class PortfolioDetailsViewModel with _$PortfolioDetailsViewModel {
  factory PortfolioDetailsViewModel(
    String portfolioName,
    List<PortfolioDetailsSymbolViewModel> symbols,
  ) = $PortfolioDetailsViewModel;
}

class PortfolioDetailsSymbolViewModel {
  final String name;
  final String symbol;
  final String currency;
  final String region;

  PortfolioDetailsSymbolViewModel({
    required this.name,
    required this.symbol,
    required this.currency,
    required this.region,
  });

  factory PortfolioDetailsSymbolViewModel.fromSymbolSearchWidgetNavigationResult(
    SymbolSearchWidgetNavigationResult item,
  ) =>
      PortfolioDetailsSymbolViewModel(
        name: item.name,
        symbol: item.symbol,
        currency: item.currency,
        region: item.region,
      );
}
