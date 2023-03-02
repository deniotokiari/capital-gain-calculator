import 'package:json_annotation/json_annotation.dart';
import 'package:data_stock/src/models/global_quote_response.dart'
    as global_quote_response_interface;

part 'global_quote_response.g.dart';

@JsonSerializable()
class GlobalQuoteContainerResponse
    implements global_quote_response_interface.GlobalQuoteContainerResponse {
  GlobalQuoteContainerResponse(this.globalQuote);

  @JsonKey(name: 'Global Quote')
  @override
  GlobalQuote globalQuote;

  factory GlobalQuoteContainerResponse.fromJson(Map<String, dynamic> json) =>
      _$GlobalQuoteContainerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalQuoteContainerResponseToJson(this);
}

@JsonSerializable()
class GlobalQuote implements global_quote_response_interface.GlobalQuote {
  GlobalQuote({
    required this.change,
    required this.changePercent,
    required this.high,
    required this.latestTradingDay,
    required this.low,
    required this.open,
    required this.previousClose,
    required this.price,
    required this.symbol,
    required this.volume,
  });

  @JsonKey(name: '01. symbol')
  @override
  String symbol;

  @JsonKey(name: '02. open')
  @override
  String open;

  @JsonKey(name: '03. high')
  @override
  String high;

  @JsonKey(name: '04. low')
  @override
  String low;

  @JsonKey(name: '05. price')
  @override
  String price;

  @JsonKey(name: '06. volume')
  @override
  String volume;

  @JsonKey(name: '07. latest trading day')
  @override
  String latestTradingDay;

  @JsonKey(name: '08. previous close')
  @override
  String previousClose;

  @JsonKey(name: '09. change')
  @override
  String change;

  @JsonKey(name: '10. change percent')
  @override
  String changePercent;

  factory GlobalQuote.fromJson(Map<String, dynamic> json) => _$GlobalQuoteFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalQuoteToJson(this);
}