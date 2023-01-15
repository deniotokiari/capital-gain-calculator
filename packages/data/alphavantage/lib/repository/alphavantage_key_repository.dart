import 'package:cloud_store/source/cloud_prefs_source.dart';

class AlphavantageKeyRepository {
  final CloudPrefsStoreSource _cloudFireStoreSource;

  AlphavantageKeyRepository(this._cloudFireStoreSource);

  Future<void> saveKey({
    required String userId,
    required String key,
  }) async {
    await _cloudFireStoreSource.add(
      userId: userId,
      name: 'alphavantage',
      value: {
        'key': key,
      },
    );
  }

  Future<String?> getKey({
    required String userId,
    required String name,
  }) async {
    return await _cloudFireStoreSource
        .get(
          userId: userId,
          name: name,
        )
        .then((value) => value?['key']);
  }
}
