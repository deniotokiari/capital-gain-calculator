import 'package:dio/dio.dart';
import 'package:stock_service/src/alphavantage/models/new_and_sentiment_response.dart';
import 'package:stock_service/src/alphavantage/models/overview_response.dart';
import 'package:stock_service/src/alphavantage/models/symbol_search_response.dart';
import 'package:stock_service/src/model/physical_currency_list_response.dart';
import 'package:stock_service/src/stock_service_api.dart';

const _function = 'function';
const _symbol = 'symbol';
const _keywords = 'keywords';
const _tickers = 'tickers';
const _timeFrom = 'time_from';
const _timeTo = 'time_to';
const _limit = 'limit';

class AlphaVantageService implements StockServiceApi {
  final _stockApiDio = Dio(BaseOptions(
    baseUrl: 'https://www.alphavantage.co',
    queryParameters: {'apikey': 'YE5DPYCSWSMC689Q'},
  ));
  final _currencyApiDio = Dio(BaseOptions(
    baseUrl: 'https://www.alphavantage.co',
    responseType: ResponseType.plain,
  ));

  Future<T> executeWithRequestsLimitCheck<T>(Future<T> future) => future;

  Future<T> executeWithJsonParsing<T>(
    String function,
    Map<String, dynamic> queryParameters,
    T Function(Map<String, dynamic> json) convert,
  ) async {
    final response = await executeWithRequestsLimitCheck(_stockApiDio.get(
      '/query',
      queryParameters: {
        _function: function,
        ...queryParameters,
      },
    ));

    return convert(response.data);
  }

  @override
  Future<OverviewResponse> overview(String symbol) => executeWithJsonParsing(
        _Functions.overview,
        {_symbol: symbol},
        OverviewResponse.fromJson,
      );

  @override
  Future<SymbolSearchResponse> symbolSearch(String keywords) => executeWithJsonParsing(
        _Functions.symbolSearch,
        {_keywords: keywords},
        SymbolSearchResponse.fromJson,
      );

  @override
  Future<PhysicCurrencyListResponse> physicCurrencyList() => _currencyApiDio
      .get('/physical_currency_list')
      .then((response) => PhysicCurrencyListResponse(response.data));

  @override
  Future<NewsAndSentimentResponse> newsAndSentiment(
    DateTime from,
    DateTime to, {
    int limit = 200,
    List<String> tickers = const [],
  }) {
    return executeWithJsonParsing(
      _Functions.newsSentiment,
      {
        _tickers: tickers.join(','),
        _timeFrom: from.toYYYYMMDDTHHMM,
        _timeTo: to.toYYYYMMDDTHHMM,
        _limit: limit.toString(),
      },
      NewsAndSentimentResponse.fromJson,
    );
  }
}

class _Functions {
  static const overview = 'OVERVIEW';
  static const symbolSearch = 'SYMBOL_SEARCH';
  static const newsSentiment = 'NEWS_SENTIMENT';
}

class RequestsLimitReached implements Exception {}

extension _DateTimeExt on DateTime {
  String _fourDigits(int n) {
    int absN = n.abs();
    String sign = n < 0 ? "-" : "";

    if (absN >= 1000) return "$n";
    if (absN >= 100) return "${sign}0$absN";
    if (absN >= 10) return "${sign}00$absN";
    
    return "${sign}000$absN";
  }

  String _sixDigits(int n) {
    assert(n < -9999 || n > 9999);
    
    int absN = n.abs();
    String sign = n < 0 ? "-" : "+";
    
    if (absN >= 100000) return "$sign$absN";
    
    return "${sign}0$absN";
  }

  String _twoDigits(int n) {
    if (n >= 10) {
      return "$n";
    } else {
      return "0$n";
    }
  }

  String get toYYYYMMDDTHHMM {
    String y = (year >= -9999 && year <= 9999) ? _fourDigits(year) : _sixDigits(year);
    String m = _twoDigits(month);
    String d = _twoDigits(day);
    String h = _twoDigits(hour);

    return '$y$m${d}T$h$m';
  }
}
