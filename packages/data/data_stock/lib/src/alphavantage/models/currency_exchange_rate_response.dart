import 'package:json_annotation/json_annotation.dart';
import 'package:data_stock/src/models/currency_exchange_rate_response.dart' as currency_exchange_rate_response_interface;

part 'currency_exchange_rate_response.g.dart';

@JsonSerializable()
class CurrencyExchangeRateContainerResponse implements currency_exchange_rate_response_interface.CurrencyExchangeRateContainerResponse {
  @JsonKey(name: 'Realtime Currency Exchange Rate')
  @override
  CurrencyExchangeRate currencyExchangeRate;

  CurrencyExchangeRateContainerResponse(this.currencyExchangeRate);

  factory CurrencyExchangeRateContainerResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrencyExchangeRateContainerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyExchangeRateContainerResponseToJson(this);
}

@JsonSerializable()
class CurrencyExchangeRate implements currency_exchange_rate_response_interface.CurrencyExchangeRate {
  CurrencyExchangeRate(
    this.fromCurrencyCode,
    this.fromCurrencyName,
    this.toCurrencyCode,
    this.toCurrencyName,
    this.exchangeRate,
    this.lastRefreshed,
  );

  @JsonKey(name: '1. From_Currency Code')
  @override
  String fromCurrencyCode;

  @JsonKey(name: '2. From_Currency Name')
  @override
  String fromCurrencyName;

  @JsonKey(name: '3. To_Currency Code')
  @override
  String toCurrencyCode;

  @JsonKey(name: '4. To_Currency Name')
  @override
  String toCurrencyName;

  @JsonKey(name: '5. Exchange Rate')
  @override
  String exchangeRate;

  @JsonKey(name: '6. Last Refreshed')
  @override
  String lastRefreshed;

  factory CurrencyExchangeRate.fromJson(Map<String, dynamic> json) => _$CurrencyExchangeRateFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyExchangeRateToJson(this);
}
