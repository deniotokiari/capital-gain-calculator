import 'package:capital_gain_calculator/main/main_bloc.dart';
import 'package:capital_gain_calculator/main/main_widget.dart';
import 'package:common/common.dart';
import 'package:flutter/foundation.dart';
import 'package:navigation/navigation.dart';
import 'package:news_api/news_api.dart';
import 'package:physical_currency/physical_currency.dart';
import 'package:portfolio_api/portfolio_api.dart';
import 'package:stock_service/stock_service.dart';
import 'package:symbol_api/symbol_api.dart';

class MainDependencyModule extends DependencyModule {
  final _modules = <DependencyModule>[
    StockServiceModule(),
    PhysicalCurrencyModule(),
    PortfolioModule(),
    SymbolApiModule(),
    NavigationModule(),
    NewsApiModule(),
  ];

  @override
  void init() {
    registerLazySingleton<LocalStorage>(() => LocalStorage());
    registerLazySingleton<AsyncValueGetter<List<PhysicalCurrency>>>(
      () => () => get<StockServiceApi>().physicCurrencyList().then(
            (response) => response.list
                .map(
                  (currency) => PhysicalCurrency(
                    code: currency.code,
                    name: currency.name,
                  ),
                )
                .toList(growable: false),
          ),
    );

    registerFactory<MainBloc>(() => MainBloc());

    for (var module in _modules) {
      module.init();
    }

    registerFactory<NavigationWidgetBuilder>(
      () => NavigationWidgetBuilder((_, __) => const MainWidget()),
      instanceName: RouteDestination.root.title,
    );
  }
}
