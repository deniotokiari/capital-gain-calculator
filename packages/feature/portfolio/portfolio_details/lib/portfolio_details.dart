library portfolio_details;

import 'package:common/common.dart';
import 'package:navigation/navigation.dart';
import 'package:portfolio_details/src/bloc/portfolio_details_bloc.dart';
import 'package:portfolio_details/src/navigation/portfolio_details_navigation_widget_builder.dart';

class PortfolioDetailsModule extends DependencyModule {
  @override
  void init() {
    registerFactory<PortfolioDetailsBloc>(() => PortfolioDetailsBloc());
    registerFactory<NavigationWidgetBuilder>(
      () => PortfolioDetailsNavigationWidgetBuilder(),
      instanceName: RouteDestination.portfolio.title,
    );
  }
}
