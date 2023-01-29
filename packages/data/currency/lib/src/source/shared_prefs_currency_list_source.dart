import 'package:currency/src/currency.dart';
import 'package:currency/src/source/currency_list_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _currencyCodeList = 'currencyCodeList';
const _currencyNameList = 'currencyNameList';

class SharedPrefsCurrencyListSource implements CurrencyListSource {
  @override
  Future<List<Currency>> getCurrencyList() async {
    final prefs = await SharedPreferences.getInstance();

    final codeList = prefs.getStringList(_currencyCodeList) ?? [];
    final nameList = prefs.getStringList(_currencyNameList) ?? [];
    final result = <Currency>[];

    if (codeList.length != nameList.length) {
      throw throw ArgumentError.value('codeList.length != nameList.length => ${codeList.length} != ${nameList.length}');
    }

    for (var i = 0; i < codeList.length; i++) {
      result.add(Currency(code: codeList[i], name: nameList[i]));
    }

    return result;
  }

  @override
  Future<void> addCurrencyList(List<Currency> list) async {
    final prefs = await SharedPreferences.getInstance();

    final codeList = <String>[];
    final nameList = <String>[];

    for (final item in list) {
      codeList.add(item.code);
      nameList.add(item.name);
    }

    await prefs.setStringList(_currencyCodeList, codeList);
    await prefs.setStringList(_currencyNameList, nameList);
  }
}
