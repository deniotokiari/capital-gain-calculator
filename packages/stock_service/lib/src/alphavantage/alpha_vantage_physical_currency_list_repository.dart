import 'package:common/common.dart';
import 'package:stock_service/src/model/physical_currency.dart';
import 'package:stock_service/src/physical_currency_list_repository.dart';
import 'package:stock_service/src/stock_service_api.dart';

class AlphaVantagePhysicalCurrencyListResponse implements PhysicalCurrencyListRepository {
  final StockServiceApi _stockServiceApi;
  final LocalStorage _localStorage;
  final List<PhysicalCurrency> _list = List.empty(growable: true);

  AlphaVantagePhysicalCurrencyListResponse(
    this._stockServiceApi,
    this._localStorage,
  );

  @override
  Future<List<PhysicalCurrency>> getPhysicalCurrencyList() async {
    // check in memory
    if (_list.isNotEmpty) {
      return _list;
    }

    // get from local storage
    final localItems = await _localStorage.collection(PhysicalCurrency.fromMap);

    if (localItems != null && localItems.isNotEmpty) {
      _list
        ..clear()
        ..addAll(localItems);
    }

    if (_list.isEmpty) {
      // fetch from backend
      final response = await _stockServiceApi
          .physicCurrencyList()
          .runCatching()
          .then<List<PhysicalCurrency>>((value) => value.map(
                success: (success) => success.data.list
                    .map((e) => PhysicalCurrency(code: e.code, name: e.name))
                    .toList(growable: false),
                failed: (_) => [],
              ));

      _list
        ..clear()
        ..addAll(response);

      // save in local storage
      await _localStorage.saveAll(response);
    }

    return _list;
  }
}
