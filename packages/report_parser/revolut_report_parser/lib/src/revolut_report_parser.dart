import 'dart:io';
import 'package:fast_csv/fast_csv.dart' as fast_csv;
import 'package:revolut_report_parser/src/revolut_report.dart';

class RevolutReportParser {
  Future<RevolutReport> parse(File file) async {
    final csv = fast_csv.parse(await file.readAsString());

    return RevolutReport.fromLines(csv);
  }
}
