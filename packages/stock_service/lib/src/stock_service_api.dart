import 'package:stock_service/src/model/overview_response.dart';

abstract class StockServiceApi {
  Future<OverviewResponse> overview(String symbol);
}
