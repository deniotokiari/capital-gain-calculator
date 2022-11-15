library cloud_sync_service;

export 'src/cloud_sync_service.dart';
export 'src/model/alphavantage_api_key_response.dart';
export 'src/alphavantage_api_key_repository.dart';

import 'package:cloud_sync_service/src/alphavantage_api_key_repository.dart';
import 'package:cloud_sync_service/src/cloud_sync_service.dart';
import 'package:common/common.dart';

class CloudSyncServiceModule extends DependencyModule {
  @override
  void init() {
    registerLazySingleton<CloudSyncService>(
      () => CloudSyncService(),
    );
    registerLazySingleton<AlphavantageApiKeyRepository>(
      () => AlphavantageApiKeyRepository(
        get(),
      ),
    );
    registerLazySingleton<Future<String>>(
      () => get<AlphavantageApiKeyRepository>().getAlphavantageApiKey(),
      instanceName: 'alphavantage_api_key',
    );
  }
}
