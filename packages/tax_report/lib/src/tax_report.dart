import 'dart:io';

import 'package:common/common.dart';
import 'package:common_report_parser/common_report_parser.dart';
import 'package:currency_converter/currency_converter.dart';

class TaxReport {
  final ReportParser _reportParser;
  final CurrencyConverter _anyCurrencyToPlnConverter;

  TaxReport(
    this._reportParser,
    this._anyCurrencyToPlnConverter,
  );

  Future<List<List<dynamic>>> dividendsTaxReport({
    required File revolut,
    required File trading212,
  }) async {
    final report = await _reportParser.parse(
      revolutReport: revolut,
      trading212Report: trading212,
    );

    final result = <List<dynamic>>[
      [
        'Date',
        'Ticker',
        'Gross',
        'Net',
        'Withholding Tax',
        'Agreement Percent',
        'Poland Tax',
        'Pay in Poland',
        'App',
      ],
    ];

    CurrencyValue totalPolandTax = CurrencyValue(value: 0.0, currency: 'PLN');

    report.dividends.sort((a, b) {
      final result = a.ticker.compareTo(b.ticker);

      if (result == 0) {
        return a.dateTime.compareTo(b.dateTime);
      } else {
        return a.ticker.compareTo(b.ticker);
      }
    });

    for (final e in report.dividends) {
      final payInPoland = await _anyCurrencyToPlnConverter.convert(e.homeTax, 'PLN', e.dateTime);
      totalPolandTax += payInPoland;

      result.add([
        e.dateTime.toString().split(' ').first,
        e.ticker,
        e.gross,
        e.net,
        e.withholdingTax,
        '${(e.agreementPercent * 100).toInt()}%',
        e.homeTax,
        payInPoland,
        e.origin.name,
      ]);
    }

    result.add([
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      totalPolandTax,
      '',
    ]);

    return result;
  }
}
