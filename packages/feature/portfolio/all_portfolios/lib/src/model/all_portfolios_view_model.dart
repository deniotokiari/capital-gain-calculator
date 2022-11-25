import 'package:common/common.dart';
import 'package:physical_currency/physical_currency.dart';

class AllPortfoliosViewModel {
  final List<PortfolioViewModel> portfolios;
  final PhysicalCurrencyValue? marketValue;
  final PhysicalCurrencyValue? returnValue;
  final PercentValue? returnPercent;

  AllPortfoliosViewModel({
    required this.portfolios,
    required this.marketValue,
    required this.returnValue,
    required this.returnPercent,
  });
}

class PortfolioViewModel {
  final String name;
  final String portfolioId;
  final PhysicalCurrencyValue? marketValue;
  final PhysicalCurrencyValue? returnValue;
  final PercentValue? returnPercent;

  PortfolioViewModel({
    required this.name,
    required this.portfolioId,
    required this.marketValue,
    required this.returnValue,
    required this.returnPercent,
  });
}
