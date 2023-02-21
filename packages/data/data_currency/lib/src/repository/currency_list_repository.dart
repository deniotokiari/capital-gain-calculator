import 'package:data_currency/src/currency.dart';
import 'package:data_currency/src/source/currency_list_source.dart';

class CurrencyListRepository {
  final CurrencyListSource _remoteCurrencyListSource;
  final CurrencyListSource _localCurrencyListSource;

  final List<Currency> _memoryCurrencyList = [];

  CurrencyListRepository(
    this._remoteCurrencyListSource,
    this._localCurrencyListSource,
  );

  Future<void> loadCurrencyList() async {
    if (_memoryCurrencyList.isEmpty) {
      final localCurrencyList = await _localCurrencyListSource.getCurrencyList();

      if (localCurrencyList.isEmpty) {
        final remoteCurrencyList = await _remoteCurrencyListSource.getCurrencyList();

        _localCurrencyListSource.addCurrencyList(remoteCurrencyList);
        _memoryCurrencyList.addAll(remoteCurrencyList);
      } else {
        _memoryCurrencyList.addAll(localCurrencyList);
      }
    }
  }

  Future<List<Currency>> getCurrencyList() async {
    await loadCurrencyList();

    return _memoryCurrencyList;
  }
}
