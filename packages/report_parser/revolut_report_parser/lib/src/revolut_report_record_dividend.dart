import 'package:common/common.dart';
import 'package:intl/intl.dart';
import 'package:revolut_report_parser/src/revolut_report_record.dart';

// 2022-03-25T05:09:53.200506Z
final _dateFormatter = DateFormat('yyyy-MM-ddTHH:mm:ss');

class RevolutReportRecordDividend {
  final DateTime date;
  final String ticker;
  final CurrencyValue totalAmount;

  RevolutReportRecordDividend({
    required this.date,
    required this.ticker,
    required this.totalAmount,
  });

  factory RevolutReportRecordDividend.fromRecord(RevolutReportRecord record) =>
      RevolutReportRecordDividend(
        date: _dateFormatter.parse(record.date),
        ticker: record.ticker,
        totalAmount: CurrencyValue(
          value: double.parse(record.totalAmount.substring(1)),
          currency: record.currency,
        ),
      );
}
