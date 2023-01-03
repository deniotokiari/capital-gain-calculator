import 'dart:convert';
import 'dart:io';

import 'package:common/common.dart';
import 'package:currency_converter/src/currency_converter.dart';
import 'package:currency_converter/src/gbx_to_gbp_currency_converter.dart';
import 'package:currency_converter/src/nbp_currency_converter.dart';
import 'package:currency_converter/src/nbp_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late NbpService nbpService;
  late CurrencyConverter gbxToGbpCurrencyConverter;
  late CurrencyConverter sut;

  setUp(() {
    nbpService = _NbpServiceMock();
    gbxToGbpCurrencyConverter = GbxToGbpCurrencyConverter();
    when(() => nbpService.getArchive()).thenAnswer(
      (_) => File('test/currency_list.csv').readAsString(encoding: latin1),
    );

    sut = NbpCurrencyConverter(nbpService, gbxToGbpCurrencyConverter);
  });

  test('test convert USD to PLN', () async {
    final result = await sut.convert(
      CurrencyValue(value: 10, currency: 'USD'),
      'PLN',
      DateTime(2022, 01, 04),
    );

    expect(result.value, 40.424);
    expect(result.currency, 'PLN');
  });

  test('test convert EUR to PLN', () async {
    final result = await sut.convert(
      CurrencyValue(value: 10, currency: 'EUR'),
      'PLN',
      DateTime(2022, 01, 04),
    );

    expect(result.value, 45.888999999999996);
    expect(result.currency, 'PLN');
  });

  test('test convert GBP to PLN', () async {
    final result = await sut.convert(
      CurrencyValue(value: 10, currency: 'GBP'),
      'PLN',
      DateTime(2022, 01, 04),
    );

    expect(result.value, 54.643);
    expect(result.currency, 'PLN');
  });

  test('test convert GBX to PLN', () async {
    final result = await sut.convert(
      CurrencyValue(value: 140, currency: 'GBX'),
      'PLN',
      DateTime(2022, 01, 04),
    );

    expect(result.value, 7.17571876);
    expect(result.currency, 'PLN');
  });
}

class _NbpServiceMock extends Mock implements NbpService {}
