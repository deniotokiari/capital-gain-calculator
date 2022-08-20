import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stock_service/src/alphavantage/models/overview_response.dart';
import 'package:stock_service/src/alphavantage/models/symbol_search_response.dart';
import 'package:stock_service/src/stock_service_api.dart';

// TODO remove before commit
const _apiKey = 'YE5DPYCSWSMC689Q';
const _baseUri = 'https://www.alphavantage.co';
const _query = '/query';
const _overview = 'OVERVIEW';
const _symbolSearch = 'SYMBOL_SEARCH';
const _function = 'function';
const _symbol = 'symbol';
const _keywords = 'keywords';

class AlphaVantageService implements StockServiceApi {
  final _dio = Dio(BaseOptions(
    baseUrl: _baseUri,
    queryParameters: {'apikey': _apiKey},
  ));

  DateTime? _lastRequestDateTime;
  int _requestsInMinuteExecuted = -1;
  int _requestsInDayExecuted = -1;

  final int requestsPerMinute;
  final int requestsPerDay;
  final ValueGetter<DateTime> nowDateTime;

  AlphaVantageService({
    required this.requestsPerMinute,
    required this.requestsPerDay,
    required this.nowDateTime,
  });

  Future<T> executeWithRequestsLimitCheck<T>(
    Future<T> future,
  ) async {
    final currentDateTime = nowDateTime();
    final lastRequestDateTime = _lastRequestDateTime ?? currentDateTime;

    final isNewMinute = currentDateTime.difference(lastRequestDateTime).inMinutes >= 1;
    final isNewDay = currentDateTime.difference(lastRequestDateTime).inDays >= 1;

    if (isNewMinute) {
      _requestsInMinuteExecuted = -1;
    }

    if (isNewDay) {
      _requestsInDayExecuted = -1;
    }

    _requestsInMinuteExecuted++;
    _requestsInDayExecuted++;
    _lastRequestDateTime = currentDateTime;

    if (_requestsInDayExecuted >= requestsPerDay) {
      throw RequestsLimitReached();
    } else if (_requestsInMinuteExecuted >= requestsPerMinute) {
      return Future.delayed(
        Duration(
          milliseconds: currentDateTime
              .add(const Duration(minutes: 1))
              .difference(currentDateTime)
              .inMilliseconds,
        ),
        () => future,
      );
    } else {
      return future;
    }
  }

  Future<T> executeWithParsing<T>(
    Future<Response> future,
    T Function(Map<String, dynamic> json) convert,
  ) async {
    final response = await executeWithRequestsLimitCheck(future);

    return convert(response.data);
  }

  @override
  Future<OverviewResponse> overview(String symbol) => executeWithParsing(
        _dio.get(_query, queryParameters: {
          _function: _overview,
          _symbol: symbol,
        }),
        OverviewResponse.fromJson,
      );

  @override
  Future<SymbolSearchResponse> symbolSearch(String keywords) => executeWithParsing(
        _dio.get(_query, queryParameters: {
          _function: _symbolSearch,
          _keywords: keywords,
        }),
        SymbolSearchResponse.fromJson,
      );
}

class RequestsLimitReached implements Exception {}
