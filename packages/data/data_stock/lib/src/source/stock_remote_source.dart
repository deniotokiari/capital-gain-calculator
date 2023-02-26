import 'package:data_stock/src/models/currency_exchange_rate_response.dart';
import 'package:data_stock/src/models/global_quote_response.dart';
import 'package:data_stock/src/models/symbol_search_response.dart';

abstract class StockRemoteSource {
  Future<SymbolSearchResponse> searchSymbol(String query);

  Future<GlobalQuoteContainerResponse> globalQuote(String symbol);

  Future<CurrencyExchangeRateContainerResponse> currencyExchangeRate({required String from, required String to});
}
