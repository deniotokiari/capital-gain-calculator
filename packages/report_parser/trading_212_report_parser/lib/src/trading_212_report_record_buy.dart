import 'package:common/common.dart';
import 'package:intl/intl.dart';
import 'package:trading_212_report_parser/src/trading_212_report_record.dart';

final _dateFormatter = DateFormat('yyyy-MM-dd HH:mm:ss');

class Trading212ReportRecordBuy {
  final DateTime time;
  final String isin;
  final String ticker;
  final String name;
  final double noOfShares;
  final CurrencyValue priceShare;
  final CurrencyValue totalEur;
  final CurrencyValue stampDutyReserveTaxEur;
  final CurrencyValue currencyConversionFeeEur;
  final CurrencyValue frenchTransactionTax;

  Trading212ReportRecordBuy({
    required this.time,
    required this.isin,
    required this.ticker,
    required this.name,
    required this.noOfShares,
    required this.priceShare,
    required this.totalEur,
    required this.stampDutyReserveTaxEur,
    required this.currencyConversionFeeEur,
    required this.frenchTransactionTax,
  });

  factory Trading212ReportRecordBuy.fromRecord(Trading212ReportRecord record) =>
      Trading212ReportRecordBuy(
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
        stampDutyReserveTaxEur: CurrencyValue(
          value: double.tryParse(record.stampDutyReserveTaxEur) ?? 0,
          currency: 'EUR',
        ),
        currencyConversionFeeEur: CurrencyValue(
          value: double.tryParse(record.currencyConversionFeeEur) ?? 0,
          currency: 'EUR',
        ),
        frenchTransactionTax: CurrencyValue(
          value: double.tryParse(record.frenchTransactionTax) ?? 0,
          currency: 'EUR',
        ),
      );

  @override
  String toString() =>
      '$time $isin $ticker $name $noOfShares $priceShare $totalEur $stampDutyReserveTaxEur $currencyConversionFeeEur $frenchTransactionTax';
}
