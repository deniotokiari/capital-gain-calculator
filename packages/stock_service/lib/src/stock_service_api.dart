import 'package:stock_service/src/model/global_quote_response.dart';
import 'package:stock_service/src/model/physical_currency_list_response.dart';
import 'package:stock_service/stock_service.dart';

abstract class StockServiceApi {
  Future<OverviewResponse> overview(String symbol);

  Future<SymbolSearchResponse> symbolSearch(String keywords);

  Future<PhysicCurrencyListResponse> physicCurrencyList();

  Future<NewsAndSentimentResponse> newsAndSentiment({
    DateTime? from,
    DateTime? to,
    int limit = 200,
    List<String> tickers = const [],
  });

  Future<GlobalQuoteContainerResponse> globalQuote(String symbol);
}
