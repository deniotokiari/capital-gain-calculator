import 'package:stock_service/src/alphavantage/models/overview_response.dart';
import 'package:stock_service/src/api_resource.dart';

abstract class StockServiceApi {
  Future<ApiResource<OverviewResponse>> overview(String symbol);
}
