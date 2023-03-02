import 'package:data_stock/src/models/currency_exchange_rate_response.dart';
import 'package:data_stock/src/models/global_quote_response.dart';
import 'package:data_stock/src/models/news_and_sentiment_response.dart';
import 'package:data_stock/src/models/symbol_search_response.dart';
import 'package:data_stock/src/models/overview_response.dart';

abstract class StockRemoteSource {
  Future<SymbolSearchResponse> searchSymbol(String query);

  Future<GlobalQuoteContainerResponse> globalQuote(String symbol);

  Future<CurrencyExchangeRateContainerResponse> currencyExchangeRate({required String from, required String to});

  Future<NewsAndSentimentResponse> newsAndSentiment({
    DateTime? from,
    DateTime? to,
    int limit = 200,
    List<String> tickers = const [],
  });

  Future<OverviewResponse> overview(String symbol);
}
