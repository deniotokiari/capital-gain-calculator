extension DateTimeExt on DateTime {
  // 15/02/2023
  String get ddMMYYYY => '${_formatNumber(day)}/${_formatNumber(month)}/$year';

  String get yyyyMMDDTHHMM => '$year${_formatNumber(month)}${_formatNumber(day)}T${_formatNumber(hour)}${_formatNumber(minute)}';

  String _formatNumber(int value) => value >= 10 ? '$value' : '0$value';
}
