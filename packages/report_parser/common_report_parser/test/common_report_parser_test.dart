import 'dart:io';

import 'package:common_report_parser/src/report_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:revolut_report_parser/revolut_report_parser.dart';
import 'package:trading_212_report_parser/trading_212_report_parser.dart';

void main() {
  late ReportParser sut;

  setUp(() {
    sut = ReportParser(RevolutReportParser(), Trading212ReportParser());
  });

  test('verify mixed report dividends', () async {
    final result = await sut.parse(
      revolutReport: File('test/revolut_report.csv'),
      trading212Report: File('test/trading_212_report.csv'),
    );

    final dividends = result.dividends;

    expect(dividends.length, 126);
  });
}
