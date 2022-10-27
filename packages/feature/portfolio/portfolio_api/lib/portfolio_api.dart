library portfolio_api;

export 'package:all_portfolios/src/widget/all_portfolios_widget.dart';
export 'package:portfolio_create/src/widget/portfolio_create_widget.dart';
export 'package:portfolio_details/src/widget/portfolio_details_widget.dart';

import 'package:all_portfolios/all_portfolios.dart';
import 'package:common/common.dart';
import 'package:portfolio_create/portfolio_create.dart';
import 'package:portfolio_details/portfolio_details.dart';
import 'package:portfolio_use_case/portfolio_use_case.dart';

class PortfolioModule extends DependencyModule {
  @override
  void init() {
    for (var module in [
      AllPortfoliosModule(),
      PortfolioCreateModule(),
      PortfolioDetailsModule(),
      PortfolioUseCaseModule(),
    ]) {
      module.init();
    }
  }
}
