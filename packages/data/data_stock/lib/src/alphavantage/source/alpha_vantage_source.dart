import 'package:data_stock/src/alphavantage/models/currency_exchange_rate_response.dart';
import 'package:data_stock/src/alphavantage/models/global_quote_response.dart';
import 'package:data_stock/src/alphavantage/models/symbol_search_response.dart';
import 'package:data_stock/src/source/stock_remote_source.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:synchronized/synchronized.dart' as synchronized;

const _function = 'function';
const _symbol = 'symbol';
const _keywords = 'keywords';
const _tickers = 'tickers';
const _timeFrom = 'time_from';
const _timeTo = 'time_to';
const _limit = 'limit';

class AlphaVantageSource implements StockRemoteSource {
  final _stockApiDio = Dio(BaseOptions(
    baseUrl: 'https://www.alphavantage.co',
  ));

  final _rateLimit = RateLimit(
    limit: 5,
    rate: const Duration(minutes: 1),
  );

  final ValueGetter<Future<String>> _apiKey;

  AlphaVantageSource(this._apiKey);

  Future<T> executeWithRequestsLimitCheck<T>(Future<T> Function() future) => _rateLimit.withRateLimit(future);

  Future<T> executeWithJsonParsing<T>(
    String function,
    Map<String, dynamic> queryParameters,
    T Function(Map<String, dynamic> json) convert,
  ) async {
    final response = await executeWithRequestsLimitCheck(() async => _stockApiDio.get(
          '/query',
          queryParameters: {
            _function: function,
            'apikey': await _apiKey(),
            ...queryParameters,
          },
        ));

    return convert(response.data);
  }

  @override
  Future<SymbolSearchResponse> searchSymbol(String query) => executeWithJsonParsing(
        _Functions.symbolSearch,
        {_keywords: query},
        SymbolSearchResponse.fromJson,
      );

  @override
  Future<GlobalQuoteContainerResponse> globalQuote(String symbol) => executeWithJsonParsing(
        _Functions.globalQuote,
        {_symbol: symbol},
        GlobalQuoteContainerResponse.fromJson,
      );

  @override
  Future<CurrencyExchangeRateContainerResponse> currencyExchangeRate({required String from, required String to}) => executeWithJsonParsing(
        _Functions.currencyExchangeRate,
        {
          'from_currency': from,
          'to_currency': to,
        },
        CurrencyExchangeRateContainerResponse.fromJson,
      );
}

class _Functions {
  static const overview = 'OVERVIEW';
  static const symbolSearch = 'SYMBOL_SEARCH';
  static const newsSentiment = 'NEWS_SENTIMENT';
  static const globalQuote = 'GLOBAL_QUOTE';
  static const currencyExchangeRate = 'CURRENCY_EXCHANGE_RATE';
}

class RateLimit {
  final int limit;
  final Duration rate;

  final _lock = synchronized.Lock();

  var _requestsPerformed = 0;
  var _firstRequestInSequence = DateTime.now().millisecondsSinceEpoch;

  RateLimit({
    required this.limit,
    required this.rate,
  });

  Future<T> withRateLimit<T>(Future<T> Function() future) => _lock.synchronized(() async {
        final timeSinceFirstRequest = Duration(
          milliseconds: DateTime.now().millisecondsSinceEpoch - _firstRequestInSequence,
        );

        if (_requestsPerformed == limit) {
          if (timeSinceFirstRequest < rate) {
            final waitTime = rate - timeSinceFirstRequest;
            print('LOG_: ${DateTime.now()}: wait => $waitTime');
            await Future.delayed(waitTime);
          }

          _requestsPerformed = 0;
          _firstRequestInSequence = DateTime.now().millisecondsSinceEpoch;
        } else if (timeSinceFirstRequest > rate) {
          _requestsPerformed = 0;
          _firstRequestInSequence = DateTime.now().millisecondsSinceEpoch;
        }

        _requestsPerformed++;
        print('LOG_: ${DateTime.now()}: request => $_requestsPerformed');

        return future();
      });
}
