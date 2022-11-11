import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio_data/portfolio_data.dart';
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
  final String sharesTotal;
  final String label;

  PortfolioDetailsSymbolViewModel({
    required this.name,
    required this.symbol,
    required this.currency,
    required this.region,
    required this.instrumentId,
    required this.sharesTotal,
    required this.label,
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
        sharesTotal: '',
        label: '',
      );

  factory PortfolioDetailsSymbolViewModel.fromSymbolAndPhysicalCurrency(
    Instrument instrument,
    List<double> lastPrice,
  ) =>
      PortfolioDetailsSymbolViewModel(
        name: instrument.symbol!.name,
        symbol: instrument.symbol!.ticker,
        currency: instrument.symbol!.physicalCurrency.code,
        region: instrument.symbol!.region,
        instrumentId: instrument.id,
        sharesTotal: instrument.count.toString(),
        label: [
          instrument.symbol?.ticker,
          if (instrument.count > 0) instrument.count.toString(),
          if (instrument.averagePrice > 0) instrument.averagePrice.toStringAsFixed(2),
          if (lastPrice.isNotEmpty) lastPrice.first.toStringAsFixed(2),
        ].join(' - '),
      );
}
