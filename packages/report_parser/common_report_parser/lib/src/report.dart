import 'package:common_report_parser/src/buy_record.dart';
import 'package:common_report_parser/src/dividend_record.dart';
import 'package:common_report_parser/src/sell_record.dart';
import 'package:revolut_report_parser/revolut_report_parser.dart';
import 'package:trading_212_report_parser/trading_212_report_parser.dart';

class Report {
  final List<DividendRecord> dividends;
  final List<BuyRecord> purchases;
  final List<SellRecord> sales;

  Report(this.dividends, this.purchases, this.sales);

  factory Report.fromReports(RevolutReport? revolutReport, Trading212Report? trading212report) =>
      Report(
        [
          ...revolutReport?.dividends.map(DividendRecord.fromRevolut) ?? [],
          ...trading212report?.dividends.map(DividendRecord.fromTrading212) ?? [],
        ]..sort((a, b) => a.dateTime.compareTo(b.dateTime)),
        [],
        [],
      );
}
