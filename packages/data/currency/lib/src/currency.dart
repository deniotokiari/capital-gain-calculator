class Currency {
  final String code;
  final String name;

  Currency({
    required this.code,
    required this.name,
  });

  @override
  int get hashCode => Object.hash(code, name);

  @override
  bool operator ==(Object other) => other is Currency && code == other.code && name == other.name;

  bool get isUsd => code.toLowerCase() == 'usd';
}
