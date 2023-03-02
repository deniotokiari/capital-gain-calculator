library data_portfolio;

import 'package:data_portfolio/src/model/portfolio.dart';
import 'package:data_portfolio/src/repository/portfolio_repository.dart';
import 'package:store/common/space.dart';
import 'package:utility/utility.dart';

export 'src/repository/portfolio_repository.dart';
export 'src/model/portfolio.dart';

class DataPortfolioModule extends DependencyModule {
  @override
  Future<void> init() async {
    registerLazySingleton(
      () => PortfolioRepository(
        Space.user,
        Portfolio.fromMap,
        get(),
      ),
    );
  }
}
