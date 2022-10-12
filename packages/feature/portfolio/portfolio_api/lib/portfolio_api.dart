library portfolio_api;

export 'package:all_portfolios/src/widget/all_portfolios_widget.dart';
export 'package:portfolio_create/src/widget/portfolio_create_widget.dart';

import 'package:all_portfolios/all_portfolios.dart';
import 'package:common/common.dart';
import 'package:portfolio_create/portfolio_create.dart';
import 'package:portfolio_data/portfolio_data.dart';

class PortfolioModule extends DependencyModule {
  @override
  void init() {
    for (var module in [
      AllPortfoliosModule(),
      PortfolioDataModule(),
      PortfolioCreateModule(),
    ]) {
      module.init();
    }
  }
}
