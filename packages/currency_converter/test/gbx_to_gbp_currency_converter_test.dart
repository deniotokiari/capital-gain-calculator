import 'package:common/common.dart';
import 'package:currency_converter/src/currency_converter.dart';
import 'package:currency_converter/src/gbx_to_gbp_currency_converter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CurrencyConverter sut;

  setUp(() {
    sut = GbxToGbpCurrencyConverter();
  });

  test('test GBX to GBP convert', () async {
    final result = await sut.convert(
      CurrencyValue(value: 25, currency: 'GBX'),
      'GBP',
      DateTime.now(),
    );

    expect(result.value, 0.2345);
    expect(result.currency, 'GBP');
  });
}
