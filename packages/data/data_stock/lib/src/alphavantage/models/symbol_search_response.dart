import 'package:json_annotation/json_annotation.dart';
import 'package:data_stock/src/models/symbol_search_response.dart' as symbol_search_response_interface;

part 'symbol_search_response.g.dart';

@JsonSerializable()
class SymbolSearchResponse implements symbol_search_response_interface.SymbolSearchResponse {
  @override
  @JsonKey(name: 'bestMatches', defaultValue: [])
  final List<SymbolSearchMatch> bestMatches;

  SymbolSearchResponse(this.bestMatches);

  factory SymbolSearchResponse.fromJson(Map<String, dynamic> json) => _$SymbolSearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SymbolSearchResponseToJson(this);
}

@JsonSerializable()
class SymbolSearchMatch implements symbol_search_response_interface.SymbolSearchMatch {
  @override
  @JsonKey(name: '1. symbol', defaultValue: '')
  String symbol;

  @override
  @JsonKey(name: '2. name', defaultValue: '')
  String name;

  @override
  @JsonKey(name: '3. type', defaultValue: '')
  String type;

  @override
  @JsonKey(name: '4. region', defaultValue: '')
  String region;

  @override
  @JsonKey(name: '5. marketOpen', defaultValue: '')
  String marketOpen;

  @override
  @JsonKey(name: '6. marketClose', defaultValue: '')
  String marketClose;

  @override
  @JsonKey(name: '8. currency', defaultValue: '')
  String currency;

  @override
  @JsonKey(name: '9. matchScore', defaultValue: '')
  String matchScore;

  SymbolSearchMatch(
    this.symbol,
    this.name,
    this.type,
    this.region,
    this.marketOpen,
    this.marketClose,
    this.currency,
    this.matchScore,
  );

  factory SymbolSearchMatch.fromJson(Map<String, dynamic> json) => _$SymbolSearchMatchFromJson(json);

  Map<String, dynamic> toJson() => _$SymbolSearchMatchToJson(this);
}
