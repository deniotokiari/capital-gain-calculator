import 'package:json_annotation/json_annotation.dart';

part 'alphavantage_api_key_response.g.dart';

@JsonSerializable()
class AlphavantageApiKeyResponse {
  @JsonKey(name: 'alphavantage_api_key', defaultValue: '')
  final String alphavantageApiKey;

  AlphavantageApiKeyResponse(this.alphavantageApiKey);

    factory AlphavantageApiKeyResponse.fromJson(Map<String, dynamic> json) =>
      _$AlphavantageApiKeyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AlphavantageApiKeyResponseToJson(this);
}
