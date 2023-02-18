import 'package:currency/currency.dart';
import 'package:store/repository/prefs_repository.dart';

const _keyAlphavantage = 'alphavantage';
const _keyUserCurrency = 'userCurrency';

class UserSettingsRepository {
  final PrefsRepository _prefsRepository;

  UserSettingsRepository(this._prefsRepository);

  Future<void> setAlphavantageKey(String key) => _prefsRepository.save(key: _keyAlphavantage, value: key);

  Future<String> getAlphavantageKey() async {
    final key = await _prefsRepository.getString(_keyAlphavantage);

    return key!;
  }

  Future<Currency> getUserCurrency() async {
    final currency = await _prefsRepository.getString(_keyUserCurrency);
    final split = currency!.split(',');

    return Currency(code: split.first, name: split.last);
  }

  Future<void> setUserCurrency(Currency currency) => _prefsRepository.save(
        key: _keyUserCurrency,
        value: '${currency.code},${currency.name}',
      );
}
