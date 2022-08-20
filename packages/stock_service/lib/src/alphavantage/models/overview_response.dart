import 'package:json_annotation/json_annotation.dart';

part 'overview_response.g.dart';

@JsonSerializable()
class OverviewResponse {
  @JsonKey(name: 'Symbol')
  final String symbol;

  @JsonKey(name: 'AssetType')
  final String assetType;

  @JsonKey(name: 'Name')
  final String name;

  @JsonKey(name: 'Description')
  final String description;

  @JsonKey(name: 'CIK')
  final String cik;

  @JsonKey(name: 'Exchange')
  final String exchange;

  @JsonKey(name: 'Currency')
  final String currency;

  @JsonKey(name: 'Country')
  final String country;

  @JsonKey(name: 'sector')
  final String sector;

  @JsonKey(name: 'Industry')
  final String industry;

  @JsonKey(name: 'Address')
  final String address;

  @JsonKey(name: 'FiscalYearEnd')
  final String fiscalYearEnd;

  @JsonKey(name: 'LatestQuarter')
  final String latestQuarter;

  @JsonKey(name: 'MarketCapitalization')
  final String marketCapitalization;

  @JsonKey(name: 'EBITDA')
  final String ebitda;

  @JsonKey(name: 'PERatio')
  final String peRatio;

  @JsonKey(name: 'PEGRatio')
  final String pegRatio;

  @JsonKey(name: 'BookValue')
  final String bookValue;

  @JsonKey(name: 'DividendPerShare')
  final String dividendPerShare;

  @JsonKey(name: 'DividendYield')
  final String dividendYield;

  @JsonKey(name: 'EPS')
  final String eps;

  @JsonKey(name: 'RevenuePerShareTTM')
  final String revenuePerShareTtm;

  @JsonKey(name: 'ProfitMargin')
  final String profitMargin;

  @JsonKey(name: 'OperatingMarginTTM')
  final String operatingMarginTtm;

  @JsonKey(name: 'ReturnOnAssetsTTM')
  final String returnOnAssetsTtm;

  @JsonKey(name: 'ReturnOnEquityTTM')
  final String returnOnEquityTtm;

  @JsonKey(name: 'RevenueTTM')
  final String revenueTtm;

  @JsonKey(name: 'GrossProfitTTM')
  final String grossProfitTtm;

  @JsonKey(name: 'DilutedEPSTTM')
  final String dilutedEpsTtm;

  @JsonKey(name: 'QuarterlyEarningsGrowthYOY')
  final String quarterlyEarningsGrowthYoy;

  @JsonKey(name: 'QuarterlyRevenueGrowthYOY')
  final String quarterlyRevenueGrowthYoy;

  @JsonKey(name: 'AnalystTargetPrice')
  final String analystTargetPrice;

  @JsonKey(name: 'TrailingPE')
  final String trailingPe;

  @JsonKey(name: 'ForwardPE')
  final String forwardPe;

  @JsonKey(name: 'PriceToSalesRatioTTM')
  final String priceToSalesRatioTtm;

  @JsonKey(name: 'PriceToBookRatio')
  final String priceToBookRatio;

  @JsonKey(name: 'EVToRevenue')
  final String evToRevenue;

  @JsonKey(name: 'EVToEBITDA')
  final String evToEbitda;

  @JsonKey(name: 'Beta')
  final String beta;

  @JsonKey(name: '52WeekHigh')
  final String high52Week;

  @JsonKey(name: '52WeekLow')
  final String low52Week;

  @JsonKey(name: '50DayMovingAverage')
  final String movingAverage50Day;

  @JsonKey(name: '200DayMovingAverage')
  final String movingAverage200Day;

  @JsonKey(name: 'SharesOutstanding')
  final String sharesOutstanding;

  @JsonKey(name: 'DividendDate')
  final String dividendDate;

  @JsonKey(name: 'ExDividendDate')
  final String exDividendDate;

  OverviewResponse(
    this.assetType,
    this.description,
    this.cik,
    this.exchange,
    this.currency,
    this.country,
    this.sector,
    this.industry,
    this.address,
    this.fiscalYearEnd,
    this.latestQuarter,
    this.marketCapitalization,
    this.ebitda,
    this.peRatio,
    this.pegRatio,
    this.bookValue,
    this.dividendPerShare,
    this.dividendYield,
    this.eps,
    this.revenuePerShareTtm,
    this.profitMargin,
    this.operatingMarginTtm,
    this.returnOnAssetsTtm,
    this.returnOnEquityTtm,
    this.revenueTtm,
    this.grossProfitTtm,
    this.dilutedEpsTtm,
    this.quarterlyEarningsGrowthYoy,
    this.quarterlyRevenueGrowthYoy,
    this.analystTargetPrice,
    this.trailingPe,
    this.forwardPe,
    this.priceToSalesRatioTtm,
    this.priceToBookRatio,
    this.evToRevenue,
    this.evToEbitda,
    this.beta,
    this.high52Week,
    this.low52Week,
    this.movingAverage50Day,
    this.movingAverage200Day,
    this.sharesOutstanding,
    this.dividendDate,
    this.exDividendDate,
    this.symbol,
    this.name,
  );

  factory OverviewResponse.fromJson(Map<String, dynamic> json) => _$OverviewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OverviewResponseToJson(this);
}
