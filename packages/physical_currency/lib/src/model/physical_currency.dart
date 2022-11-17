class PhysicalCurrency {
  final String id;
  final String code;
  final String name;
  final bool isUsd;

  PhysicalCurrency({
    required this.id,
    required this.code,
    required this.name,
    required this.isUsd,
  });

  String get sign {
    if (code == 'USD') {
      return '\$';
    } else if (code == 'EUR') {
      return '£';
    } else {
      return '';
    }
  }
}
