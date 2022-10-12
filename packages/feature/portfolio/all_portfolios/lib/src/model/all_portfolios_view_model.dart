import 'package:physical_currency/physical_currency.dart';
import 'package:portfolio_data/portfolio_data.dart';

class AllPortfoliosViewModel {
  final List<PortfolioViewModel> portfolios;

  AllPortfoliosViewModel(this.portfolios);
}

class PortfolioViewModel {
  final String name;
  final String currency;

  PortfolioViewModel({
    required this.name,
    required this.currency,
  });

  factory PortfolioViewModel.fromPortfolioAndCurrency(
    Portfolio portfolio,
    PhysicalCurrency currency,
  ) =>
      PortfolioViewModel(
        name: portfolio.name,
        currency: currency.code,
      );
}
