import 'package:common/common.dart';

abstract class CurrencyConverter {
  Future<CurrencyValue> convert(CurrencyValue from, String to, DateTime date);
}
