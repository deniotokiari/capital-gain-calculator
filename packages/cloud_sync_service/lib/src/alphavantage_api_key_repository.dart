import 'package:cloud_sync_service/cloud_sync_service.dart';
import 'package:common/common.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _alphavantageApiKey = 'alphavantageApiKey';

class AlphavantageApiKeyRepository {
  final CloudSyncService _cloudSyncService;

  AlphavantageApiKeyRepository(
    this._cloudSyncService,
  );

  Future<String> getAlphavantageApiKey() async {
    final preferences = await SharedPreferences.getInstance();
    var key = preferences.getString(_alphavantageApiKey);

    if (key == null) {
      await preferences.setString(
        _alphavantageApiKey,
        await _cloudSyncService.getAlphavantageApiKey().then(
              (value) => value.alphavantageApiKey,
            ),
      );
    }

    return key.require;
  }
}
