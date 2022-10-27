import 'package:portfolio_data/portfolio_data.dart';

class AllPortfoliosViewModel {
  final List<PortfolioViewModel> portfolios;

  AllPortfoliosViewModel(this.portfolios);

  factory AllPortfoliosViewModel.fromPortfoliosList(List<Portfolio> items) =>
      AllPortfoliosViewModel(
        [
          ...items.map(PortfolioViewModel.fromPortfolio),
        ],
      );
}

class PortfolioViewModel {
  final String name;
  final String currency;
  final String portfolioId;

  PortfolioViewModel({
    required this.name,
    required this.currency,
    required this.portfolioId,
  });

  factory PortfolioViewModel.fromPortfolio(
    Portfolio portfolio,
  ) =>
      PortfolioViewModel(
        name: portfolio.name,
        currency: portfolio.physicalCurrency.code,
        portfolioId: portfolio.id,
      );
}
