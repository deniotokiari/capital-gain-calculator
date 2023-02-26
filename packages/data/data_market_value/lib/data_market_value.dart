library data_market_value;

import 'package:data_market_value/src/repository/market_value_repository.dart';
import 'package:utility/utility.dart';

export 'src/model/market_value.dart';
export 'src/repository/market_value_repository.dart';

class DataMarketValueModule extends DependencyModule {
  @override
  Future<void> init() async {
    registerLazySingleton(() => MarketValueRepository(
          get(),
          get(),
          get(),
          get(),
          get(),
        ));
  }
}
