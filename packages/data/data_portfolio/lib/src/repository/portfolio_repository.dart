import 'package:data_portfolio/src/model/portfolio.dart';
import 'package:store/store.dart';

class PortfolioRepository extends DbRepository<Portfolio> {
  PortfolioRepository(
    super.space,
    super.map,
    super.db,
  );
}
