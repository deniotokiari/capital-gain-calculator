library all_portfolios;

import 'package:all_portfolios/src/bloc/all_portfolios_bloc.dart';
import 'package:common/common.dart';

class AllPortfoliosModule extends DependencyModule {
  @override
  void init() {
    registerFactory<AllPortfoliosBloc>(
      () => AllPortfoliosBloc(
        get(),
        get(),
        get(),
      ),
    );
  }
}
