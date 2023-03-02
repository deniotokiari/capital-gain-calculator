// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_exchange_rate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyExchangeRateContainerResponse
    _$CurrencyExchangeRateContainerResponseFromJson(
            Map<String, dynamic> json) =>
        CurrencyExchangeRateContainerResponse(
          CurrencyExchangeRate.fromJson(
              json['Realtime Currency Exchange Rate'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CurrencyExchangeRateContainerResponseToJson(
        CurrencyExchangeRateContainerResponse instance) =>
    <String, dynamic>{
      'Realtime Currency Exchange Rate': instance.currencyExchangeRate,
    };

CurrencyExchangeRate _$CurrencyExchangeRateFromJson(
        Map<String, dynamic> json) =>
    CurrencyExchangeRate(
      json['1. From_Currency Code'] as String,
      json['2. From_Currency Name'] as String,
      json['3. To_Currency Code'] as String,
      json['4. To_Currency Name'] as String,
      json['5. Exchange Rate'] as String,
      json['6. Last Refreshed'] as String,
    );

Map<String, dynamic> _$CurrencyExchangeRateToJson(
        CurrencyExchangeRate instance) =>
    <String, dynamic>{
      '1. From_Currency Code': instance.fromCurrencyCode,
      '2. From_Currency Name': instance.fromCurrencyName,
      '3. To_Currency Code': instance.toCurrencyCode,
      '4. To_Currency Name': instance.toCurrencyName,
      '5. Exchange Rate': instance.exchangeRate,
      '6. Last Refreshed': instance.lastRefreshed,
    };
