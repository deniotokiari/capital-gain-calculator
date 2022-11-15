import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:stock_service/src/alphavantage/models/global_quote_response.dart';
import 'package:synchronized/synchronized.dart' as synchronized;

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
  ));
  final _currencyApiDio = Dio(BaseOptions(
    baseUrl: 'https://www.alphavantage.co',
    responseType: ResponseType.plain,
  ));

  final _rateLimit = RateLimit(
    limit: 5,
    rate: const Duration(minutes: 1),
  );

  final ValueGetter<Future<String>> _apiKey;

  AlphaVantageService(
    this._apiKey,
  );

  Future<T> executeWithRequestsLimitCheck<T>(Future<T> Function() future) =>
      _rateLimit.withRateLimit(future);

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
  Future<NewsAndSentimentResponse> newsAndSentiment({
    DateTime? from,
    DateTime? to,
    int limit = 200,
    List<String> tickers = const [],
  }) {
    return executeWithJsonParsing(
      _Functions.newsSentiment,
      {
        _tickers: tickers.join(','),
        if (from != null) _timeFrom: from.toYYYYMMDDTHHMM,
        if (to != null) _timeTo: to.toYYYYMMDDTHHMM,
        _limit: limit.toString(),
      },
      NewsAndSentimentResponse.fromJson,
    );
  }

  @override
  Future<GlobalQuoteContainerResponse> globalQuote(String symbol) => executeWithJsonParsing(
        _Functions.globalQuote,
        {_symbol: symbol},
        GlobalQuoteContainerResponse.fromJson,
      );
}

class _Functions {
  static const overview = 'OVERVIEW';
  static const symbolSearch = 'SYMBOL_SEARCH';
  static const newsSentiment = 'NEWS_SENTIMENT';
  static const globalQuote = 'GLOBAL_QUOTE';
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
