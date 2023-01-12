import 'dart:convert';
import 'dart:io';

import 'package:common_report_parser/common_report_parser.dart';
import 'package:currency_converter/currency_converter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tax_report/src/tax_report.dart';

void main() {
  late NbpService nbpService;
  late TaxReport sut;

  setUp(() {
    nbpService = _NbpServiceMock();
    when(() => nbpService.getArchive()).thenAnswer(
      (_) => File('test/currency_list.csv').readAsString(encoding: latin1),
    );

    sut = TaxReport(
      ReportParser(
        RevolutReportParser(),
        Trading212ReportParser(),
      ),
      NbpCurrencyConverter(
        nbpService,
        GbxToGbpCurrencyConverter(),
      ),
    );
  });

  test('adds one to input values', () async {
    final result = await sut.dividendsTaxReport(
      revolut: File('test/revolut_report.csv'),
      trading212: File('test/trading_212_report.csv'),
    );

    final file = File('test/out.csv').openWrite();

    for (var e in result) {
      file.writeln(e.join(','));
    }

    await file.close(); 
  });
}

class _NbpServiceMock extends Mock implements NbpService {}
