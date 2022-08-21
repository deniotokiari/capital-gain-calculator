import 'package:stock_service/src/model/physical_currency_list_response.dart';
import 'package:stock_service/stock_service.dart';

abstract class StockServiceApi {
  Future<OverviewResponse> overview(String symbol);

  Future<SymbolSearchResponse> symbolSearch(String keywords);

  Future<PhysicCurrencyListResponse> physicCurrencyList();
}
