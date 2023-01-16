import 'package:store/repository/prefs_repository.dart';

class AlphavantageKeyRepository {
  final PrefsRepository _prefsRepository;

  AlphavantageKeyRepository(this._prefsRepository);

  Future<void> saveKey({
    required String key,
  }) async {
    await _prefsRepository.save(
      key: 'alphavantage',
      value: key,
    );
  }

  Future<String?> getKey() => _prefsRepository.getString('alphavantage');
}
