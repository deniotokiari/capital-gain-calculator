// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symbol_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SymbolSearchResponse _$SymbolSearchResponseFromJson(
        Map<String, dynamic> json) =>
    SymbolSearchResponse(
      (json['bestMatches'] as List<dynamic>?)
              ?.map(
                  (e) => SymbolSearchMatch.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$SymbolSearchResponseToJson(
        SymbolSearchResponse instance) =>
    <String, dynamic>{
      'bestMatches': instance.bestMatches,
    };

SymbolSearchMatch _$SymbolSearchMatchFromJson(Map<String, dynamic> json) =>
    SymbolSearchMatch(
      json['1. symbol'] as String? ?? '',
      json['2. name'] as String? ?? '',
      json['3. type'] as String? ?? '',
      json['4. region'] as String? ?? '',
      json['5. marketOpen'] as String? ?? '',
      json['6. marketClose'] as String? ?? '',
      json['8. currency'] as String? ?? '',
      json['9. matchScore'] as String? ?? '',
    );

Map<String, dynamic> _$SymbolSearchMatchToJson(SymbolSearchMatch instance) =>
    <String, dynamic>{
      '1. symbol': instance.symbol,
      '2. name': instance.name,
      '3. type': instance.type,
      '4. region': instance.region,
      '5. marketOpen': instance.marketOpen,
      '6. marketClose': instance.marketClose,
      '8. currency': instance.currency,
      '9. matchScore': instance.matchScore,
    };
