import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:physical_currency/physical_currency.dart';
import 'package:symbol_api/symbol_api.dart';

part 'portfolio_details_view_model.freezed.dart';

@freezed
class PortfolioDetailsViewModel with _$PortfolioDetailsViewModel {
  factory PortfolioDetailsViewModel(
    String portfolioName,
    List<String> tickers,
    List<PortfolioDetailsSymbolViewModel> symbols,
  ) = $PortfolioDetailsViewModel;

  factory PortfolioDetailsViewModel.initial() => PortfolioDetailsViewModel(
        '',
        [],
        [],
      );
}

class PortfolioDetailsSymbolViewModel {
  final String name;
  final String symbol;
  final String currency;
  final String region;
  final String instrumentId;

  PortfolioDetailsSymbolViewModel({
    required this.name,
    required this.symbol,
    required this.currency,
    required this.region,
    required this.instrumentId,
  });

  factory PortfolioDetailsSymbolViewModel.fromSymbolSearchWidgetNavigationResult(
    SymbolSearchWidgetNavigationResult item,
    String instrumentId,
  ) =>
      PortfolioDetailsSymbolViewModel(
        name: item.name,
        symbol: item.symbol,
        currency: item.currency,
        region: item.region,
        instrumentId: instrumentId,
      );

  factory PortfolioDetailsSymbolViewModel.fromSymbolAndPhysicalCurrency(
    Symbol symbol,
    String instrumentId,
    PhysicalCurrency physicalCurrency,
  ) =>
      PortfolioDetailsSymbolViewModel(
        name: symbol.name,
        symbol: symbol.symbol,
        currency: physicalCurrency.code,
        region: symbol.region,
        instrumentId: instrumentId,
      );
}
