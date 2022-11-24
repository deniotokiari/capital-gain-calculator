library portfolio_details;

import 'package:common/common.dart';
import 'package:navigation/navigation.dart';
import 'package:portfolio_details/src/bloc/portfolio_add_position_bloc.dart';
import 'package:portfolio_details/src/bloc/portfolio_details_bloc.dart';
import 'package:portfolio_details/src/portfolio_details_instrument_position/portfolio_details_instrument_positions_bloc.dart';
import 'package:portfolio_details/src/navigation/portfolio_details_navigation_widget_builder.dart';
import 'package:portfolio_details/src/portfolio_details_header/portfolio_details_header_bloc.dart';
import 'package:portfolio_details/src/portfolio_details_instrument/portfolio_details_instrument_bloc.dart';

class PortfolioDetailsModule extends DependencyModule {
  @override
  void init() {
    registerFactory<PortfolioDetailsBloc>(
      () => PortfolioDetailsBloc(
        get(),
        get(),
        get(),
        get(),
      ),
    );
    registerFactory<PortfolioAddPositionBloc>(
      () => PortfolioAddPositionBloc(
        get(),
        get(),
        get(),
      ),
    );
    registerFactory<NavigationWidgetBuilder>(
      () => PortfolioDetailsNavigationWidgetBuilder(),
      instanceName: RouteDestination.portfolio.title,
    );
    registerFactory<PortfolioInstrumentPositionsBloc>(
      () => PortfolioInstrumentPositionsBloc(
        get(),
        get(),
      ),
    );
    registerFactory<PortfolioDetailsHeaderBloc>(
      () => PortfolioDetailsHeaderBloc(
        get(),
        get(),
        get(),
        get(),
      ),
    );
    registerFactory<PortfolioDetailsInstrumentBloc>(
      () => PortfolioDetailsInstrumentBloc(
        get(),
        get(),
        get(),
      ),
    );
  }
}
