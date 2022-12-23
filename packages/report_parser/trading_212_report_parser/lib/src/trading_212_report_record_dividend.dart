import 'package:common/common.dart';
import 'package:intl/intl.dart';
import 'package:trading_212_report_parser/src/trading_212_report_record.dart';

final _dateFormatter = DateFormat('yyyy-MM-dd HH:mm:ss');

class Trading212ReportRecordDividend {
  final DateTime time;
  final String isin;
  final String ticker;
  final String name;
  final double noOfShares;
  final CurrencyValue priceShare;
  final CurrencyValue totalEur;
  final CurrencyValue withholdingTax;

  Trading212ReportRecordDividend({
    required this.time,
    required this.isin,
    required this.ticker,
    required this.name,
    required this.noOfShares,
    required this.priceShare,
    required this.totalEur,
    required this.withholdingTax,
  });

  CurrencyValue get gross => priceShare * noOfShares + withholdingTax;

  double get taxPercent {
    if (withholdingTax.value == 0.0) {
      return 0.0;
    } else {
      final gross = this.gross;
      final result = [0.15, 0.19, 0.21, 0.25, 0.26375, 0.35]
          .map((e) => [(gross.value * e - withholdingTax.value).abs(), e])
          .reduce((c, n) => c.first < n.first ? c : n);

      return result.last;
    }
  }

  factory Trading212ReportRecordDividend.fromRecord(Trading212ReportRecord record) =>
      Trading212ReportRecordDividend(
        time: _dateFormatter.parse(record.time),
        isin: record.isin,
        ticker: record.ticker,
        name: record.name,
        noOfShares: double.parse(record.noOfShares),
        priceShare: CurrencyValue(
          value: double.parse(record.priceShare),
          currency: record.currencyPriceShare,
        ),
        totalEur: CurrencyValue(
          value: double.parse(record.totalEur),
          currency: 'EUR',
        ),
        withholdingTax: CurrencyValue(
          value: double.parse(record.withholdingTax),
          currency: record.currencyWithholdingTax,
        ),
      );

  @override
  String toString() =>
      '$time $isin $ticker $name $noOfShares $priceShare $totalEur $withholdingTax';
}
