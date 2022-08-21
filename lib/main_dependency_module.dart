import 'package:capital_gain_calculator/search/search_bloc.dart';
import 'package:common/common.dart';
import 'package:stock_service/stock_service.dart';

class MainDependencyModule extends DependencyModule {
  final _modules = <DependencyModule>[
    StockServiceModule(),
  ];

  @override
  void init() {
    registerFactory<SearchBloc>(() => SearchBloc(get()));

    for (var module in _modules) {
      module.init();
    }
  }
}
