import 'package:data_stock/src/models/symbol_search_response.dart';

abstract class StockRemoteSource {
  Future<SymbolSearchResponse> searchSymbol(String query);
}
