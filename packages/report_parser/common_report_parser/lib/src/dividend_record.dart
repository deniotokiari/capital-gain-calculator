import 'package:common/common.dart';
import 'package:revolut_report_parser/revolut_report_parser.dart';
import 'package:trading_212_report_parser/trading_212_report_parser.dart';

class DividendRecord {
  final DateTime dateTime;
  final String ticker;
  final CurrencyValue gross;
  final CurrencyValue net;
  final CurrencyValue withholdingTax;
  final CurrencyValue homeTax;
  final double agreementPercent;

  DividendRecord({
    required this.dateTime,
    required this.ticker,
    required this.gross,
    required this.net,
    required this.withholdingTax,
    required this.homeTax,
    required this.agreementPercent,
  });

  factory DividendRecord.fromRevolut(RevolutReportRecordDividend dividend) {
    final agreementPercent = _getAgreementPercent(
      countryCode: 'US',
      withholdingTax: dividend.gross - dividend.totalAmount,
      gross: dividend.gross,
    );

    return DividendRecord(
      dateTime: dividend.date,
      ticker: dividend.ticker,
      gross: dividend.gross,
      net: dividend.totalAmount,
      withholdingTax: dividend.gross - dividend.totalAmount,
      homeTax: dividend.totalAmount * agreementPercent,
      agreementPercent: agreementPercent,
    );
  }

  factory DividendRecord.fromTrading212(Trading212ReportRecordDividend dividend) {
    final agreementPercent = _getAgreementPercent(
      countryCode: dividend.countryCode,
      withholdingTax: dividend.withholdingTax,
      gross: dividend.gross,
    );

    return DividendRecord(
      dateTime: dividend.time,
      ticker: dividend.ticker,
      gross: dividend.gross,
      net: dividend.net,
      withholdingTax: dividend.withholdingTax,
      homeTax: dividend.net * agreementPercent,
      agreementPercent: agreementPercent,
    );
  }

  static double _withholdingTaxPercent(
    CurrencyValue gross,
    CurrencyValue withholdingTax,
  ) {
    if (withholdingTax.value == 0.0) {
      return 0.0;
    } else {
      final result = [0.15, 0.19, 0.21, 0.25, 0.26375, 0.35]
          .map((e) => [(gross.value * e - withholdingTax.value).abs(), e])
          .reduce((c, n) => c.first < n.first ? c : n);

      return result.last;
    }
  }

  static double _getAgreementPercent({
    required String countryCode,
    required CurrencyValue gross,
    required CurrencyValue withholdingTax,
  }) {
    final withholdingTaxPercent = _withholdingTaxPercent(gross, withholdingTax);

    if (countryCode == 'US' && withholdingTaxPercent == 0.15) {
      // 0.19 - 0.15
      return 0.04;
    } else if (countryCode == 'DE' && withholdingTaxPercent == 0.26375) {
      // 0.19 - 0.15
      return 0.04;
    } else if (countryCode == 'FR' && withholdingTaxPercent == 0.25) {
      // 0.19 - 0.15
      return 0.04;
    } else if (countryCode == 'NL' && withholdingTaxPercent == 0.15) {
      // 0.19 - 0.15
      return 0.04;
    } else if (countryCode == 'CH' && withholdingTaxPercent == 0.35) {
      // 0.19 - 0.15
      return 0.04;
    } else if (countryCode == 'CA' && withholdingTaxPercent == 0.15) {
      // 0.19 - 0.15
      return 0.04;
    } else if (countryCode == 'ES' && withholdingTaxPercent == 0.19) {
      // 0.19 - 0.15
      return 0.04;
    } else if (countryCode == 'IE' && withholdingTaxPercent == 0.25) {
      // 0.19 - 0.15
      return 0.04;
    } else if (withholdingTaxPercent == 0.21) {
      // 0.19 - 0.10
      return 0.09;
    } else {
      // 0.19 - 0.0
      return 0.19;
    }
  }
}
