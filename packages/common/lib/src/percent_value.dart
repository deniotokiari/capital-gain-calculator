class PercentValue {
  final double value;

  PercentValue(this.value);

  String get formatted => '${value > 0 ? '+' : '-'}${(value * 100).abs().toStringAsFixed(2)}%';
}
