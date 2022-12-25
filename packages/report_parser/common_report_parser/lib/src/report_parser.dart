import 'dart:io';

import 'package:common_report_parser/src/report.dart';
import 'package:revolut_report_parser/revolut_report_parser.dart';
import 'package:trading_212_report_parser/trading_212_report_parser.dart';

class ReportParser {
  final RevolutReportParser _revolutReportParser;
  final Trading212ReportParser _trading212reportParser;

  ReportParser(this._revolutReportParser, this._trading212reportParser);

  Future<Report> parse({
    required File? revolutReport,
    required File? trading212Report,
  }) async {
    RevolutReport? revolutReportResult;
    Trading212Report? trading212reportResult;

    if (revolutReport != null) {
      revolutReportResult = await _revolutReportParser.parse(revolutReport);
    }

    if (trading212Report != null) {
      trading212reportResult = await _trading212reportParser.parse(trading212Report);
    }

    return Report.fromReports(
      revolutReportResult,
      trading212reportResult,
    );
  }
}
