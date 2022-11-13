import 'package:capital_gain_calculator/main/main_bloc.dart';
import 'package:capital_gain_calculator/main/main_widget.dart';
import 'package:cloud_sync_service/cloud_sync_service.dart';
import 'package:common/common.dart';
import 'package:db/db.dart';
import 'package:navigation/navigation.dart';
import 'package:news_api/news_api.dart';
import 'package:physical_currency/physical_currency.dart';
import 'package:portfolio_api/portfolio_api.dart';
import 'package:stock_service/stock_service.dart';
import 'package:symbol_api/symbol_api.dart';

class MainDependencyModule extends DependencyModule {
  final _modules = <DependencyModule>[
    DbModule(),
    CloudSyncServiceModule(),
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
    registerFactory<MainBloc>(
      () => MainBloc(
        get(),
      ),
    );

    for (var module in _modules) {
      module.init();
    }

    registerFactory<NavigationWidgetBuilder>(
      () => NavigationWidgetBuilder((_, __) => const MainWidget()),
      instanceName: RouteDestination.root.title,
    );
  }
}
