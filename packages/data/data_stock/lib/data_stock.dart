library data_stock;

import 'package:data_stock/src/alphavantage/source/alpha_vantage_source.dart';
import 'package:data_stock/src/source/stock_remote_source.dart';
import 'package:flutter/foundation.dart';
import 'package:utility/utility.dart';

export 'src/source/stock_remote_source.dart';
export 'src/models/symbol_search_response.dart';

class DataStockModule extends DependencyModule {
  final ValueGetter<Future<String>> _apiKey;

  DataStockModule(this._apiKey);

  @override
  Future<void> init() async {
    registerLazySingleton<StockRemoteSource>(() => AlphaVantageSource(_apiKey));
  }
}
