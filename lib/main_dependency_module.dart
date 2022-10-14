import 'package:capital_gain_calculator/main/main_bloc.dart';
import 'package:capital_gain_calculator/main/main_widget.dart';
import 'package:common/common.dart';
import 'package:flutter/foundation.dart';
import 'package:physical_currency/physical_currency.dart';
import 'package:portfolio_api/portfolio_api.dart';
import 'package:stock_service/stock_service.dart';

class MainDependencyModule extends DependencyModule {
  final _modules = <DependencyModule>[
    StockServiceModule(),
    PhysicalCurrencyModule(),
    PortfolioModule(),
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

    registerFactory<NavigationPath>(() => NavigationPath((_, __) => const MainWidget()), instanceName: '/');
  }
}
