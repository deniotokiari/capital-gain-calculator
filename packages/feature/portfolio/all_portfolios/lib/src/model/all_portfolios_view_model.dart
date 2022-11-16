import 'package:portfolio_data/portfolio_data.dart';

class AllPortfoliosViewModel {
  final List<PortfolioViewModel> portfolios;
  final double marketValue;
  final double returnValue;
  final double returnPercent;

  AllPortfoliosViewModel({
   required this.portfolios,
    required this.marketValue,
    required this.returnValue,
    required this.returnPercent,
  });
}

class PortfolioViewModel {
  final String name;
  final String currency;
  final String portfolioId;
  final double marketValue;
  final double returnValue;
  final double returnPercent;

  PortfolioViewModel({
    required this.name,
    required this.currency,
    required this.portfolioId,
    required this.marketValue,
    required this.returnValue,
    required this.returnPercent,
  });

  factory PortfolioViewModel.fromPortfolio(
    Portfolio portfolio,
    double marketValue,
    double returnValue,
    double returnPercent,
  ) =>
      PortfolioViewModel(
        name: portfolio.name,
        currency: portfolio.physicalCurrency.code,
        portfolioId: portfolio.id,
        marketValue: marketValue,
        returnValue: returnValue,
        returnPercent: returnPercent,
      );
}
