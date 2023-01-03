import 'package:common/common.dart';
import 'package:currency_converter/src/currency_converter.dart';

class GbxToGbpCurrencyConverter implements CurrencyConverter {
  @override
  Future<CurrencyValue> convert(CurrencyValue from, String to, DateTime date) async {
    if (from.currency != 'GBX') {
      throw ArgumentError.value('Not GBX');
    } else {
      return CurrencyValue(value: from.value * 0.00938, currency: 'GBP');
    }
  }
}
