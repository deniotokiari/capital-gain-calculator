class Trading212ReportRecord {
  final String action;
  final String time;
  final String isin;
  final String ticker;
  final String name;
  final String noOfShares;
  final String priceShare;
  final String currencyPriceShare;
  final String exchangeRate;
  final String resultEur;
  final String totalEur;
  final String withholdingTax;
  final String currencyWithholdingTax;
  final String chargeAmountEur;
  final String stampDutyReserveTaxEur;
  final String notes;
  final String id;
  final String currencyConversionFeeEur;
  final String frenchTransactionTax;

  Trading212ReportRecord({
    required this.action,
    required this.time,
    required this.isin,
    required this.ticker,
    required this.name,
    required this.noOfShares,
    required this.priceShare,
    required this.currencyPriceShare,
    required this.exchangeRate,
    required this.resultEur,
    required this.totalEur,
    required this.withholdingTax,
    required this.currencyWithholdingTax,
    required this.chargeAmountEur,
    required this.stampDutyReserveTaxEur,
    required this.notes,
    required this.id,
    required this.currencyConversionFeeEur,
    required this.frenchTransactionTax,
  });

  factory Trading212ReportRecord.fromLine(List<String> line) => Trading212ReportRecord(
        action: line[0],
        time: line[1],
        isin: line[2],
        ticker: line[3],
        name: line[4],
        noOfShares: line[5],
        priceShare: line[6],
        currencyPriceShare: line[7],
        exchangeRate: line[8],
        resultEur: line[9],
        totalEur: line[10],
        withholdingTax: line[11],
        currencyWithholdingTax: line[12],
        chargeAmountEur: line[13],
        stampDutyReserveTaxEur: line[14],
        notes: line[15],
        id: line[16],
        currencyConversionFeeEur: line[17],
        frenchTransactionTax: line[18],
      );
}
