import 'package:common/common.dart';
import 'package:stock_service/src/model/physical_currency.dart';
import 'package:stock_service/src/physical_currency_list_repository.dart';
import 'package:stock_service/src/stock_service_api.dart';

class AlphaVantagePhysicalCurrencyListResponse implements PhysicalCurrencyListRepository {
  final StockServiceApi _stockServiceApi;
  final List<PhysicalCurrency> _list = List.empty(growable: true);

  AlphaVantagePhysicalCurrencyListResponse(this._stockServiceApi);

  @override
  Future<List<PhysicalCurrency>> getPhysicalCurrencyList() async {
    if (_list.isEmpty) {
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
    }

    return _list;
  }
}
