import 'package:store/source/cloud_firestore_prefs_source.dart';

class PrefsRepository {
  final CloudFirestorePrefsSource _cloudFirestorePrefsSource;

  PrefsRepository(this._cloudFirestorePrefsSource);

  Future<void> save({
    required String key,
    required String value,
  }) =>
      _cloudFirestorePrefsSource.add(name: key, value: {'value': value});

  Future<String?> getString(String key) => _cloudFirestorePrefsSource.get(name: key).then(
        (value) => value?['value'],
      );
}
