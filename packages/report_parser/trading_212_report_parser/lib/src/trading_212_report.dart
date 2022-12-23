import 'package:trading_212_report_parser/src/trading_212_report_record.dart';
import 'package:trading_212_report_parser/src/trading_212_report_record_buy.dart';
import 'package:trading_212_report_parser/src/trading_212_report_record_dividend.dart';
import 'package:trading_212_report_parser/src/trading_212_report_record_sell.dart';

class Trading212Report {
  final List<Trading212ReportRecord> records;

  Trading212Report(this.records);

  factory Trading212Report.fromLines(List<List<String>> lines) => Trading212Report(
        lines.map(Trading212ReportRecord.fromLine).toList(growable: false),
      );

  List<Trading212ReportRecordDividend> get dividends => records
      .where((e) => e.action.contains('Dividend'))
      .map(Trading212ReportRecordDividend.fromRecord)
      .toList(growable: false);

  List<Trading212ReportRecordBuy> get purchases => records
      .where((e) => e.action.contains('buy'))
      .map(Trading212ReportRecordBuy.fromRecord)
      .toList(growable: false);

  List<Trading212ReportRecordSell> get sales => records
      .where((e) => e.action.contains('sell'))
      .map(Trading212ReportRecordSell.fromRecord)
      .toList(growable: false);
}
