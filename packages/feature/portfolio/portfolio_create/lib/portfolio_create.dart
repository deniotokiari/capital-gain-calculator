library portfolio_create;

import 'package:common/common.dart';
import 'package:portfolio_create/src/bloc/create_portfolio_bloc.dart';

class PortfolioCreateModule extends DependencyModule {
  @override
  void init() {
    registerFactory<CreatePortfolioBloc>(() => CreatePortfolioBloc(
          get(),
          get(),
        ));
  }
}
