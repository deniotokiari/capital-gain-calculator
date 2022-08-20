import 'package:stock_service/stock_service.dart';

abstract class StockServiceApi {
  Future<OverviewResponse> overview(String symbol);

  Future<SymbolSearchResponse> symbolSearch(String keywords);
}
