class PhysicalCurrencyValue {
  final String currencyId;
  final double value;

  PhysicalCurrencyValue({
    required this.currencyId,
    required this.value,
  });

  factory PhysicalCurrencyValue.fromMap(Map<String, dynamic> map) => PhysicalCurrencyValue(
        currencyId: map['currencyId'],
        value: map['value'],
      );

  Map<String, dynamic> toMap() => {
        'currencyId': currencyId,
        'value': value,
      };
}
