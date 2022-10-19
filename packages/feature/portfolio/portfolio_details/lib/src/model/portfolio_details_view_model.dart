import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:physical_currency/physical_currency.dart';
import 'package:symbol_api/symbol_api.dart';

part 'portfolio_details_view_model.freezed.dart';

@freezed
class PortfolioDetailsViewModel with _$PortfolioDetailsViewModel {
  factory PortfolioDetailsViewModel(
    String portfolioName,
    List<PortfolioDetailsSymbolViewModel> symbols,
  ) = $PortfolioDetailsViewModel;

  factory PortfolioDetailsViewModel.initial() => PortfolioDetailsViewModel(
        '',
        [],
      );
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

  factory PortfolioDetailsSymbolViewModel.fromSymbol(
    Symbol symbol,
    PhysicalCurrency physicalCurrency,
  ) =>
      PortfolioDetailsSymbolViewModel(
        name: symbol.name,
        symbol: symbol.symbol,
        currency: physicalCurrency.code,
        region: symbol.region,
      );
}
