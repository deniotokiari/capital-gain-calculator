library stock_service;

import 'package:common/common.dart';
import 'package:stock_service/src/alphavantage/alpha_vantage_service.dart';
import 'package:stock_service/src/stock_service_api.dart';

export 'src/stock_service_api.dart';
export 'src/alphavantage/alpha_vantage_service.dart';
export 'src/model/overview_response.dart';
export 'src/model/symbol_search_response.dart';

class StockServiceModule extends DependencyModule {
  @override
  void init() {
    registerSingleton<StockServiceApi>(AlphaVantageService());
  }
}
