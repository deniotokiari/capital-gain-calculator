import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:revolut_report_parser/src/revolut_report_parser.dart';

void main() {
  late RevolutReportParser sut;

  setUp(() {
    sut = RevolutReportParser();
  });

  test('check Revolut report parsing', () async {
    final result = await sut.parse(File('test/report.csv'));

    expect(result.records.length, isNot(0));
  });

  test('check Revolut report dividends', () async {
    final result = await sut.parse(File('test/report.csv')).then((value) => value.dividends);

    expect(result.length, isNot(0));
  });

  test('check Revolut report purchases', () async {
    final result = await sut.parse(File('test/report.csv')).then((value) => value.purchases);

    expect(result.length, isNot(0));
  });
}
