import 'package:capital_gain_calculator/main/main_bloc.dart';
import 'package:capital_gain_calculator/portfolio/create_portfolio_bloc.dart';
import 'package:capital_gain_calculator/portfolio/portfolio_bloc.dart';
import 'package:capital_gain_calculator/portfolio/portfolio_repository.dart';
import 'package:capital_gain_calculator/search/search_bloc.dart';
import 'package:common/common.dart';
import 'package:stock_service/stock_service.dart';

class MainDependencyModule extends DependencyModule {
  final _modules = <DependencyModule>[
    StockServiceModule(),
  ];

  @override
  void init() {
    registerSingleton<LocalStorage>(LocalStorage());
    registerFactory<SearchBloc>(() => SearchBloc(get()));
    registerFactory<CreatePortfolioBloc>(() => CreatePortfolioBloc(
          get(),
          get(),
        ));
    registerFactory<MainBloc>(() => MainBloc(get()));
    registerFactoryParam<PortfolioBloc, Portfolio, dynamic>(
      (param1, _) => PortfolioBloc(param1),
    );

    registerSingleton<PortfolioRepository>(PortfolioRepository(get()));

    for (var module in _modules) {
      module.init();
    }
  }
}
