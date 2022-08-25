import 'package:stock_service/stock_service.dart';

class PortfolioRepository {
  final _portfolios = <Portfolio>[];

  Future<void> save(Portfolio portfolio) async {
    _portfolios.add(portfolio);
  }

  Future<List<Portfolio>> getAll() async {
    return _portfolios.toList();
  }
}

class Portfolio {
  final String title;
  final PhysicalCurrency physicalCurrency;

  Portfolio(
    this.title,
    this.physicalCurrency,
  );

  int get id => Object.hashAll([title, physicalCurrency]);
}
