import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:trading_212_report_parser/src/trading_212_report_parser.dart';

void main() {
  late Trading212ReportParser sut;

  setUp(() {
    sut = Trading212ReportParser();
  });

  test('check trading 212 report parsing', () async {
    final result = await sut.parse(File('test/report.csv'));

    expect(result.records.length, isNot(0));
  });

  test('check trading 212 report dividends', () async {
    final result = await sut.parse(File('test/report.csv')).then((value) => value.dividends);

    expect(result.length, isNot(0));
  });

  test('check trading 212 report purchases', () async {
    final result = await sut.parse(File('test/report.csv')).then((value) => value.purchases);

    expect(result.length, isNot(0));
  });

  test('check trading 212 report sales', () async {
    final result = await sut.parse(File('test/report.csv')).then((value) => value.sales);

    expect(result.length, isNot(0));
  });
}
