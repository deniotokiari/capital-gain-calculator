class PhysicalCurrency {
  final String code;
  final String name;

  PhysicalCurrency({
    required this.code,
    required this.name,
  });

  factory PhysicalCurrency.fromMap(Map<String, dynamic> map) => PhysicalCurrency(
        code: map['code'],
        name: map['name'],
      );

  String get id => Object.hashAll([code, name]).toString();

  bool get isUsd => code.toLowerCase() == 'usd';

  Map<String, dynamic> get toMap => {
        'code': code,
        'name': name,
      };
}
