library portfolio_use_case;

export 'src/get_all_portfolios_use_case.dart';
export 'src/portfolios_updates_use_case.dart';
export 'src/create_portfolio_use_case.dart';

import 'package:common/common.dart';
import 'package:portfolio_use_case/src/create_portfolio_use_case.dart';
import 'package:portfolio_use_case/src/get_all_portfolios_use_case.dart';
import 'package:portfolio_use_case/src/portfolios_updates_use_case.dart';

class PortfolioUseCaseModule extends DependencyModule {
  @override
  void init() {
    registerFactory<GetAllPortfoliosUseCase>(
      () => GetAllPortfoliosUseCase(
        get(),
        get(),
      ),
    );
    registerFactory<PortfoliosUpdatesUseCase>(
      () => PortfoliosUpdatesUseCase(
        get(),
        get(),
      ),
    );
    registerFactory<CreatePortfolioUseCase>(
      () => CreatePortfolioUseCase(
        get(),
      ),
    );
  }
}
