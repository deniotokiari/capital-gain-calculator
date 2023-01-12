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
        'Tax 19%',
        'Withholding Tax With Tax Agreement',
        'Broker',
      ],
    ];

    report.dividends.sort((a, b) {
      final result = a.ticker.compareTo(b.ticker);

      if (result == 0) {
        return a.dateTime.compareTo(b.dateTime);
      } else {
        return a.ticker.compareTo(b.ticker);
      }
    });

    var totalTax = CurrencyValue(value: 0.0, currency: 'PLN');
    var totalWithholdingTaxWithTaxAgreement = CurrencyValue(value: 0.0, currency: 'PLN');

    String? previousTicker;

    for (final e in report.dividends) {
      final tax = await _anyCurrencyToPlnConverter.convert(e.gross, 'PLN', e.dateTime) * 0.19;
      final withholdingTaxWithTaxAgreement =
          await _anyCurrencyToPlnConverter.convert(e.gross, 'PLN', e.dateTime) * e.agreementPercent;

      totalTax += tax;
      totalWithholdingTaxWithTaxAgreement += withholdingTaxWithTaxAgreement;

      if (previousTicker != null && previousTicker != e.ticker) {
        result.add(['', '', '', '', '', '', '', '', '']);
      }

      previousTicker = e.ticker;

      result.add([
        e.dateTime.toString().split(' ').first,
        e.ticker,
        e.gross,
        e.net,
        e.withholdingTax,
        '${(e.agreementPercent * 100).toInt()}%',
        tax,
        withholdingTaxWithTaxAgreement,
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
      totalTax,
      totalWithholdingTaxWithTaxAgreement,
      totalTax - totalWithholdingTaxWithTaxAgreement
    ]);

    return result;
  }
}
