import 'package:dio/dio.dart';
import 'package:stock_service/src/alphavantage/models/overview_response.dart';
import 'package:stock_service/src/alphavantage/models/symbol_search_response.dart';
import 'package:stock_service/src/stock_service_api.dart';

const _function = 'function';
const _symbol = 'symbol';
const _keywords = 'keywords';

class AlphaVantageService implements StockServiceApi {
  final _dio = Dio(BaseOptions(
    baseUrl: 'https://www.alphavantage.co',
    queryParameters: {'apikey': 'YE5DPYCSWSMC689Q'},
  ));

  Future<T> executeWithRequestsLimitCheck<T>(Future<T> future) => future;

  Future<T> executeWithParsing<T>(
    String function,
    Map<String, dynamic> queryParameters,
    T Function(Map<String, dynamic> json) convert,
  ) async {
    final response = await executeWithRequestsLimitCheck(_dio.get(
      '/query',
      queryParameters: {
        _function: function,
        ...queryParameters,
      },
    ));

    return convert(response.data);
  }

  @override
  Future<OverviewResponse> overview(String symbol) => executeWithParsing(
        _Functions.overview,
        {_symbol: symbol},
        OverviewResponse.fromJson,
      );

  @override
  Future<SymbolSearchResponse> symbolSearch(String keywords) => executeWithParsing(
        _Functions.symbolSearch,
        {_keywords: keywords},
        SymbolSearchResponse.fromJson,
      );
}

class _Functions {
  static const overview = 'OVERVIEW';
  static const symbolSearch = 'SYMBOL_SEARCH';
}

class RequestsLimitReached implements Exception {}
