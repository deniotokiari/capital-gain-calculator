library stock_service;

import 'package:common/common.dart';
import 'package:stock_service/src/alphavantage/alpha_vantage_physical_currency_list_repository.dart';
import 'package:stock_service/src/alphavantage/alpha_vantage_service.dart';
import 'package:stock_service/src/physical_currency_list_repository.dart';
import 'package:stock_service/src/stock_service_api.dart';

export 'src/stock_service_api.dart';
export 'src/alphavantage/alpha_vantage_service.dart';
export 'src/model/overview_response.dart';
export 'src/model/symbol_search_response.dart';
export 'src/model/physical_currency.dart';
export 'src/physical_currency_list_repository.dart';

class StockServiceModule extends DependencyModule {
  @override
  void init() {
    registerSingleton<StockServiceApi>(AlphaVantageService());
    registerLazySingleton<PhysicalCurrencyListRepository>(
      () => AlphaVantagePhysicalCurrencyListResponse(get(), get()),
    );
  }
}
