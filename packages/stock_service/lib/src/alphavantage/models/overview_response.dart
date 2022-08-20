import 'package:json_annotation/json_annotation.dart';
import 'package:stock_service/src/model/overview_response.dart' as overview_response_interface;

part 'overview_response.g.dart';

@JsonSerializable()
class OverviewResponse implements overview_response_interface.OverviewResponse {
  @override
  @JsonKey(name: 'Symbol', defaultValue: '')
  final String symbol;

  @JsonKey(name: 'AssetType', defaultValue: '')
  final String assetType;

  @override
  @JsonKey(name: 'Name', defaultValue: '')
  final String name;

  @JsonKey(name: 'Description', defaultValue: '')
  final String description;

  @JsonKey(name: 'CIK', defaultValue: '')
  final String cik;

  @JsonKey(name: 'Exchange', defaultValue: '')
  final String exchange;

  @JsonKey(name: 'Currency', defaultValue: '')
  final String currency;

  @JsonKey(name: 'Country', defaultValue: '')
  final String country;

  @JsonKey(name: 'sector', defaultValue: '')
  final String sector;

  @JsonKey(name: 'Industry', defaultValue: '')
  final String industry;

  @JsonKey(name: 'Address', defaultValue: '')
  final String address;

  @JsonKey(name: 'FiscalYearEnd', defaultValue: '')
  final String fiscalYearEnd;

  @JsonKey(name: 'LatestQuarter', defaultValue: '')
  final String latestQuarter;

  @JsonKey(name: 'MarketCapitalization', defaultValue: '')
  final String marketCapitalization;

  @JsonKey(name: 'EBITDA', defaultValue: '')
  final String ebitda;

  @JsonKey(name: 'PERatio', defaultValue: '')
  final String peRatio;

  @JsonKey(name: 'PEGRatio', defaultValue: '')
  final String pegRatio;

  @JsonKey(name: 'BookValue', defaultValue: '')
  final String bookValue;

  @JsonKey(name: 'DividendPerShare', defaultValue: '')
  final String dividendPerShare;

  @JsonKey(name: 'DividendYield', defaultValue: '')
  final String dividendYield;

  @JsonKey(name: 'EPS', defaultValue: '')
  final String eps;

  @JsonKey(name: 'RevenuePerShareTTM', defaultValue: '')
  final String revenuePerShareTtm;

  @JsonKey(name: 'ProfitMargin', defaultValue: '')
  final String profitMargin;

  @JsonKey(name: 'OperatingMarginTTM', defaultValue: '')
  final String operatingMarginTtm;

  @JsonKey(name: 'ReturnOnAssetsTTM', defaultValue: '')
  final String returnOnAssetsTtm;

  @JsonKey(name: 'ReturnOnEquityTTM', defaultValue: '')
  final String returnOnEquityTtm;

  @JsonKey(name: 'RevenueTTM', defaultValue: '')
  final String revenueTtm;

  @JsonKey(name: 'GrossProfitTTM', defaultValue: '')
  final String grossProfitTtm;

  @JsonKey(name: 'DilutedEPSTTM', defaultValue: '')
  final String dilutedEpsTtm;

  @JsonKey(name: 'QuarterlyEarningsGrowthYOY', defaultValue: '')
  final String quarterlyEarningsGrowthYoy;

  @JsonKey(name: 'QuarterlyRevenueGrowthYOY', defaultValue: '')
  final String quarterlyRevenueGrowthYoy;

  @JsonKey(name: 'AnalystTargetPrice', defaultValue: '')
  final String analystTargetPrice;

  @JsonKey(name: 'TrailingPE', defaultValue: '')
  final String trailingPe;

  @JsonKey(name: 'ForwardPE', defaultValue: '')
  final String forwardPe;

  @JsonKey(name: 'PriceToSalesRatioTTM', defaultValue: '')
  final String priceToSalesRatioTtm;

  @JsonKey(name: 'PriceToBookRatio', defaultValue: '')
  final String priceToBookRatio;

  @JsonKey(name: 'EVToRevenue', defaultValue: '')
  final String evToRevenue;

  @JsonKey(name: 'EVToEBITDA', defaultValue: '')
  final String evToEbitda;

  @JsonKey(name: 'Beta', defaultValue: '')
  final String beta;

  @JsonKey(name: '52WeekHigh', defaultValue: '')
  final String high52Week;

  @JsonKey(name: '52WeekLow', defaultValue: '')
  final String low52Week;

  @JsonKey(name: '50DayMovingAverage', defaultValue: '')
  final String movingAverage50Day;

  @JsonKey(name: '200DayMovingAverage', defaultValue: '')
  final String movingAverage200Day;

  @JsonKey(name: 'SharesOutstanding', defaultValue: '')
  final String sharesOutstanding;

  @JsonKey(name: 'DividendDate', defaultValue: '')
  final String dividendDate;

  @JsonKey(name: 'ExDividendDate', defaultValue: '')
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
