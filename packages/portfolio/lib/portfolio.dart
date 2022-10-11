library portfolio;

export 'src/model/portfolio.dart';
export 'src/repository/portfolio_repository.dart';

import 'package:common/common.dart';
import 'package:portfolio/src/repository/portfolio_repository.dart';

class PortfolioModule extends DependencyModule {
  @override
  void init() {
    registerLazySingleton<PortfolioRepository>(
      () => PortfolioRepository(
        get(),
      ),
    );
  }
}
