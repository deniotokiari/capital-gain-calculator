library portfolio_details;

import 'package:common/common.dart';
import 'package:portfolio_details/src/navigation/portfolio_details_navigation_path.dart';

class PortfolioDetailsModule extends DependencyModule {
  @override
  void init() {
    registerFactory<NavigationPath>(() => PortfolioDetailsNavigationPath(), instanceName: '/portfolio');
  }
}
