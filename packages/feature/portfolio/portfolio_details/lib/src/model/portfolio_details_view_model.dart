import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio_data/portfolio_data.dart';
import 'package:symbol_api/symbol_api.dart';

part 'portfolio_details_view_model.freezed.dart';

@freezed
class PortfolioDetailsViewModel with _$PortfolioDetailsViewModel {
  factory PortfolioDetailsViewModel(
    String portfolioName,
    String currency,
    double marketPrice,
    double returnValue,
    double returnPercent,
    List<String> tickers,
    List<PortfolioDetailsSymbolViewModel> symbols,
  ) = $PortfolioDetailsViewModel;

  factory PortfolioDetailsViewModel.initial() => PortfolioDetailsViewModel(
        '',
        '',
        0,
        0,
        0,
        [],
        [],
      );
}

class PortfolioDetailsSymbolViewModel {
  final String instrumentId;
  final String ticker;
  final String currency;
  final double marketValue;
  final double returnValue;
  final double returnPercent;

  PortfolioDetailsSymbolViewModel({
    required this.instrumentId,
    required this.ticker,
    required this.currency,
    required this.marketValue,
    required this.returnValue,
    required this.returnPercent,
  });

  factory PortfolioDetailsSymbolViewModel.fromSymbolSearchWidgetNavigationResult(
    SymbolSearchWidgetNavigationResult item,
    String instrumentId,
  ) =>
      PortfolioDetailsSymbolViewModel(
        instrumentId: instrumentId,
        ticker: '',
        currency: '',
        marketValue: 0,
        returnValue: 0,
        returnPercent: 0,
      );

  factory PortfolioDetailsSymbolViewModel.fromInstrument(
    Instrument instrument,
  ) =>
      PortfolioDetailsSymbolViewModel(
        instrumentId: instrument.id,
        ticker: instrument.symbol!.ticker,
        currency: instrument.symbol!.physicalCurrency.sign,
        marketValue: instrument.invested + instrument.returnValue,
        returnValue: instrument.returnValue,
        returnPercent: instrument.returnPercent,
      );
}
