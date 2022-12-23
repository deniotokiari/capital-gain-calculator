import 'package:common/common.dart';
import 'package:intl/intl.dart';
import 'package:revolut_report_parser/src/revolut_report_record.dart';

// 2022-03-25T05:09:53.200506Z
final _dateFormatter = DateFormat('yyyy-MM-ddTHH:mm:ss');

class RevolutReportRecordBuy {
  final DateTime date;
  final String ticker;
  final double quantity;
  final CurrencyValue pricePerShare;
  final CurrencyValue totalAmount;
  final String currency;

  RevolutReportRecordBuy({
    required this.date,
    required this.ticker,
    required this.quantity,
    required this.pricePerShare,
    required this.totalAmount,
    required this.currency,
  });

  factory RevolutReportRecordBuy.fromRecord(RevolutReportRecord record) => RevolutReportRecordBuy(
        date: _dateFormatter.parse(record.date),
        ticker: record.ticker,
        quantity: double.parse(record.quantity),
        pricePerShare: CurrencyValue(
          value: double.parse(record.pricePerShare.substring(1)),
          currency: record.currency,
        ),
        totalAmount: CurrencyValue(
          value: double.parse(record.totalAmount.substring(1)),
          currency: record.currency,
        ),
        currency: record.currency,
      );
}
