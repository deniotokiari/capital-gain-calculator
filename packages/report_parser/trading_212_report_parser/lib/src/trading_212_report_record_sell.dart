import 'package:common/common.dart';
import 'package:intl/intl.dart';
import 'package:trading_212_report_parser/src/trading_212_report_record.dart';

final _dateFormatter = DateFormat('yyyy-MM-dd HH:mm:ss');

class Trading212ReportRecordSell {
  final DateTime time;
  final String isin;
  final String ticker;
  final String name;
  final double noOfShares;
  final CurrencyValue priceShare;
  final CurrencyValue resultEur;
  final CurrencyValue totalEur;
  final CurrencyValue currencyConversionFeeEur;

  Trading212ReportRecordSell({
    required this.time,
    required this.isin,
    required this.ticker,
    required this.name,
    required this.noOfShares,
    required this.priceShare,
    required this.resultEur,
    required this.totalEur,
    required this.currencyConversionFeeEur,
  });

  factory Trading212ReportRecordSell.fromRecord(Trading212ReportRecord record) =>
      Trading212ReportRecordSell(
        time: _dateFormatter.parse(record.time),
        isin: record.isin,
        ticker: record.ticker,
        name: record.name,
        noOfShares: double.parse(record.noOfShares),
        priceShare: CurrencyValue(
          value: double.parse(record.priceShare),
          currency: record.currencyPriceShare,
        ),
        resultEur: CurrencyValue(
          value: double.parse(record.resultEur),
          currency: 'EUR',
        ),
        totalEur: CurrencyValue(
          value: double.parse(record.totalEur),
          currency: 'EUR',
        ),
        currencyConversionFeeEur: CurrencyValue(
          value: double.tryParse(record.currencyConversionFeeEur) ?? 0,
          currency: 'EUR',
        ),
      );

  @override
  String toString() =>
      '$time $isin $ticker $name $noOfShares $priceShare $resultEur $totalEur $currencyConversionFeeEur';
}
