import "package:collection/collection.dart";

import 'package:revolut_report_parser/src/revolut_report_record.dart';
import 'package:revolut_report_parser/src/revolut_report_record_buy.dart';
import 'package:revolut_report_parser/src/revolut_report_record_dividend.dart';

class RevolutReport {
  final List<RevolutReportRecord> records;

  RevolutReport(this.records);

  factory RevolutReport.fromLines(List<List<String>> lines) => RevolutReport(
        lines.map(RevolutReportRecord.fromLine).toList(growable: false),
      );

  List<RevolutReportRecordDividend> get dividends {
    final rawDividends = records
        .where((e) => e.type.contains('DIVIDEND'))
        .map(RevolutReportRecordDividend.fromRecord)
        .toList(growable: false);

    final map = rawDividends.groupListsBy((e) => e.ticker);
    final result = <RevolutReportRecordDividend>[];

    for (final ticker in map.keys) {
      final records = map[ticker]!;

      if (ticker == 'VALE') {
        records.sort((a, b) => a.date.compareTo(b.date));

        for (var i = 0; i < records.length; i++) {
          final current = records[i];
          final next = (i + 1) >= records.length ? null : records[i + 1];

          if (next != null && current.date.month == next.date.month) {
            result.add(RevolutReportRecordDividend.fromDividend(current, 0.15));
          } else {
            result.add(RevolutReportRecordDividend.fromDividend(
              current,
              0,
            ));
          }
        }
      } else {
        result.addAll(records);
      }
    }

    result.sort((a, b) => a.date.compareTo(b.date));

    return result;
  }

  List<RevolutReportRecordBuy> get purchases => records
      .where((e) => e.type.contains('BUY'))
      .map(RevolutReportRecordBuy.fromRecord)
      .toList(growable: false);
}
