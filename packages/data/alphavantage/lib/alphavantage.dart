library alphavantage;

import 'package:alphavantage/repository/alphavantage_key_repository.dart';
import 'package:utility/utility.dart';

export 'repository/alphavantage_key_repository.dart';

class AlphavantageModule extends DependencyModule {
  @override
  Future<void> init() async {
    registerLazySingleton(() => AlphavantageKeyRepository(get()));
  }
}
