library portfolio_data;

export 'src/model/portfolio.dart';
export 'src/repository/portfolio_repository.dart';
export 'src/model/portfolio_instrument.dart';
export 'src/repository/portfolio_instrument.dart';

import 'package:common/common.dart';
import 'package:portfolio_data/src/repository/portfolio_instrument.dart';
import 'package:portfolio_data/src/repository/portfolio_repository.dart';

class PortfolioDataModule extends DependencyModule {
  @override
  void init() {
    registerLazySingleton<PortfolioRepository>(
      () => PortfolioRepository(
        get(),
      ),
    );
    registerLazySingleton<PortfolioInstrumentRepository>(
      () => PortfolioInstrumentRepository(
        get(),
      ),
    );
  }
}
