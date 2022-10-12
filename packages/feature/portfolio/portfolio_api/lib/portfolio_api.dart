library portfolio_api;

export 'package:portfolio_create/src/widget/portfolio_create_widget.dart';

import 'package:common/common.dart';
import 'package:portfolio_create/portfolio_create.dart';
import 'package:portfolio_data/portfolio_data.dart';

class PortfolioModule extends DependencyModule {
  @override
  void init() {
    for (var module in [
      PortfolioDataModule(),
      PortfolioCreateModule(),
    ]) {
      module.init();
    }
  }
}
