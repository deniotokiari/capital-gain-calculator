class PhysicalCurrency {
  final String code;
  final String name;

  PhysicalCurrency({
    required this.code,
    required this.name,
  });

  bool get isUsd => code.toLowerCase() == 'usd';
}
