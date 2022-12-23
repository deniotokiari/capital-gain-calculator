class RevolutReportRecord {
  final String date;
  final String ticker;
  final String type;
  final String quantity;
  final String pricePerShare;
  final String totalAmount;
  final String currency;
  final String fxRate;

  RevolutReportRecord({
    required this.date,
    required this.ticker,
    required this.type,
    required this.quantity,
    required this.pricePerShare,
    required this.totalAmount,
    required this.currency,
    required this.fxRate,
  });

  factory RevolutReportRecord.fromLine(List<String> line) => RevolutReportRecord(
        date: line[0],
        ticker: line[1],
        type: line[2],
        quantity: line[3],
        pricePerShare: line[4],
        totalAmount: line[5],
        currency: line[6],
        fxRate: line[7],
      );
}
