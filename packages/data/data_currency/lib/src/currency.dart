class Currency {
  final String code;
  final String name;

  Currency({
    required this.code,
    required this.name,
  });

  factory Currency.fromMap(Map<String, dynamic> map) => Currency(
        code: map['code'],
        name: map['name'],
      );

  Map<String, dynamic> get toMap => {
        'code': code,
        'name': name,
      };

  @override
  int get hashCode => Object.hash(code, name);

  @override
  bool operator ==(Object other) => other is Currency && code == other.code && name == other.name;

  bool get isUsd => code.toLowerCase() == 'usd';

  bool get isGbx => code.toLowerCase() == 'gbx';

  String get formatted => '$name ($code)';
}

extension CurrencyExt on List<Currency> {
  List<String> get formatted => map((e) => e.formatted).toList(growable: false);
}
