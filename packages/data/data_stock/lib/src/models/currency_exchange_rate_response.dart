abstract class CurrencyExchangeRateContainerResponse {
  abstract final CurrencyExchangeRate currencyExchangeRate;
}

abstract class CurrencyExchangeRate {
  abstract final String fromCurrencyCode;
  abstract final String fromCurrencyName;
  abstract final String toCurrencyCode;
  abstract final String toCurrencyName;
  abstract final String exchangeRate;
  abstract final String lastRefreshed;
}
