import 'package:revolut_report_parser/src/revolut_report_record.dart';
import 'package:revolut_report_parser/src/revolut_report_record_buy.dart';
import 'package:revolut_report_parser/src/revolut_report_record_dividend.dart';

class RevolutReport {
  final List<RevolutReportRecord> records;

  RevolutReport(this.records);

  factory RevolutReport.fromLines(List<List<String>> lines) => RevolutReport(
        lines.map(RevolutReportRecord.fromLine).toList(growable: false),
      );

  List<RevolutReportRecordDividend> get dividends => records
      .where((e) => e.type.contains('DIVIDEND'))
      .map(RevolutReportRecordDividend.fromRecord)
      .toList(growable: false);

  List<RevolutReportRecordBuy> get purchases => records
      .where((e) => e.type.contains('BUY'))
      .map(RevolutReportRecordBuy.fromRecord)
      .toList(growable: false);
}
