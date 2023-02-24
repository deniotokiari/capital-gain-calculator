import 'package:data_currency/src/currency.dart';

class CurrencyValue {
  final double value;
  final Currency currency;

  CurrencyValue({
    required this.value,
    required this.currency,
  });

  factory CurrencyValue.fromMap(Map<String, dynamic> map) => CurrencyValue(
        value: map['value'],
        currency: Currency.fromMap(map['currency']),
      );

  Map<String, dynamic> get toMap => {
        'value': value,
        'currency': currency.toMap,
      };

  CurrencyValue operator +(CurrencyValue other) {
    if (currency != other.currency) {
      throw ArgumentError.value(other.currency);
    }

    return CurrencyValue(value: value + other.value, currency: currency);
  }

  CurrencyValue operator -(CurrencyValue other) {
    if (currency != other.currency) {
      throw ArgumentError.value(other.currency);
    }

    return CurrencyValue(value: value - other.value, currency: currency);
  }

  CurrencyValue operator *(num value) {
    return CurrencyValue(value: this.value * value, currency: currency);
  }

  CurrencyValue operator /(num value) {
    return CurrencyValue(value: this.value / value, currency: currency);
  }

  @override
  String toString() => '${value.toStringAsFixed(2)}${currency.code}';
}
