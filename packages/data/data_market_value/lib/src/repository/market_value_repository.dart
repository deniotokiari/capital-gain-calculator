import 'package:data_market_value/src/model/market_value.dart';

class MarketValueRepository {
  Future<MarketValue?> getPositionMarketValue(String positionId) async {}

  Future<MarketValue?> getInstrumentMarketValue(String instrumentId) async {}

  // need converter for currency, since portfolio could contain instrument with different positions
  Future<MarketValue?> getPortfolioMarketValue(String portfolioId) async {}

  // need converter for currency, since portfolio could be in different currency then profile
  Future<MarketValue?> getProfileMarketValue() async {}
}
