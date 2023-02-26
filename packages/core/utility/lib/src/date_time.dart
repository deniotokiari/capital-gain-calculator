extension DateTimeExt on DateTime {
  String get ddMMYYYY => '${_formatNumber(day)}/${_formatNumber(month)}/$year';

  String _formatNumber(int value) => value >= 10 ? '$value' : '0$value';
}
