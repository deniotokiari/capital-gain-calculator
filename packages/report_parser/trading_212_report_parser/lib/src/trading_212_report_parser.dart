import 'dart:io';
import 'package:fast_csv/fast_csv.dart' as fast_csv;

import 'package:trading_212_report_parser/src/trading_212_report.dart';

class Trading212ReportParser {
  Future<Trading212Report> parse(File file) async {
    final csv = fast_csv.parse(await file.readAsString());

    return Trading212Report.fromLines(csv);
  }
}
