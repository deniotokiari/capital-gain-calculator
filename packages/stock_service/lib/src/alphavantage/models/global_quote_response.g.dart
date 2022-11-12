// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_quote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalQuoteContainerResponse _$GlobalQuoteContainerResponseFromJson(
        Map<String, dynamic> json) =>
    GlobalQuoteContainerResponse(
      GlobalQuote.fromJson(json['Global Quote'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GlobalQuoteContainerResponseToJson(
        GlobalQuoteContainerResponse instance) =>
    <String, dynamic>{
      'Global Quote': instance.globalQuote,
    };

GlobalQuote _$GlobalQuoteFromJson(Map<String, dynamic> json) => GlobalQuote(
      change: json['09. change'] as String,
      changePercent: json['10. change percent'] as String,
      high: json['03. high'] as String,
      latestTradingDay: json['07. latest trading day'] as String,
      low: json['04. low'] as String,
      open: json['02. open'] as String,
      previousClose: json['08. previous close'] as String,
      price: json['05. price'] as String,
      symbol: json['01. symbol'] as String,
      volume: json['06. volume'] as String,
    );

Map<String, dynamic> _$GlobalQuoteToJson(GlobalQuote instance) =>
    <String, dynamic>{
      '01. symbol': instance.symbol,
      '02. open': instance.open,
      '03. high': instance.high,
      '04. low': instance.low,
      '05. price': instance.price,
      '06. volume': instance.volume,
      '07. latest trading day': instance.latestTradingDay,
      '08. previous close': instance.previousClose,
      '09. change': instance.change,
      '10. change percent': instance.changePercent,
    };
