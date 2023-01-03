import 'package:csv/csv.dart';
import 'package:currency_converter/src/nbp_service.dart';

import 'package:common/common.dart';
import 'package:currency_converter/src/currency_converter.dart';

class NbpCurrencyConverter implements CurrencyConverter {
  final NbpService _nbpService;
  final CurrencyConverter _gbxToGbpCurrencyConverter;
  final Map<DateTime, Map<String, double>> _currencyMap = {};

  NbpCurrencyConverter(
    this._nbpService,
    this._gbxToGbpCurrencyConverter,
  );

  Future<void> _prepareCurrencyMap() async {
    if (_currencyMap.isNotEmpty) {
      return;
    }

    final serviceResponse = await _nbpService.getArchive();
    const converter = CsvToListConverter();
    final csv = converter.convert(serviceResponse, textDelimiter: '\x00', fieldDelimiter: ';');

    final currencyList = csv.where((e) => e.first.toString().contains('kod ISO')).first;

    for (final line in csv.sublist(2, csv.length - 4)) {
      final date = line.first.toString();
      final year = int.parse(date.substring(0, 4));
      final month = int.parse(date.substring(4, 6));
      final day = int.parse(date.substring(6, 8));
      final Map<String, double> result = {};

      for (var i = 1; i < line.length - 3; i++) {
        result[currencyList[i]] = double.tryParse(line[i].toString().replaceAll(',', '.')) ?? 0;
      }

      _currencyMap[DateTime(year, month, day)] = result;
    }
  }

  @override
  Future<CurrencyValue> convert(CurrencyValue from, String to, DateTime date) async {
    await _prepareCurrencyMap();

    late CurrencyValue valueToConvert;

    if (from.currency == 'GBX') {
      valueToConvert = await _gbxToGbpCurrencyConverter.convert(from, 'GBP', date);
    } else {
      valueToConvert = from;
    }

    var previousDate = DateTime(date.year, date.month, date.day);
    double? value;

    while (value == null) {
      previousDate = previousDate.add(const Duration(days: -1));
      value = _currencyMap[previousDate]?[valueToConvert.currency];
    }

    return CurrencyValue(
      value: valueToConvert.value * value,
      currency: to,
    );
  }
}
