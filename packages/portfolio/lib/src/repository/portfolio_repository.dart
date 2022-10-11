import 'package:common/common.dart';
import 'package:portfolio/src/model/portfolio.dart';

class PortfolioRepository {
  final LocalStorage _localStorage;

  PortfolioRepository(
    this._localStorage,
  );

  Future<void> add(Portfolio portfolio) {
    return _localStorage.save(portfolio);
  }

  Future<List<Portfolio>> getAll() {
    return _localStorage.collection(Portfolio.fromMap);
  }
}
