import 'package:data_currency/src/currency.dart';

abstract class CurrencyListSource {
  Future<List<Currency>> getCurrencyList();

  Future<void> addCurrencyList(List<Currency> list);
}
