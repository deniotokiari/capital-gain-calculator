import 'package:common/common.dart';

class PhysicalCurrency extends LocalStorageEntity {
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

  @override
  String get id => Object.hashAll([code, name]).toString();

  @override
  Map<String, dynamic> get toMap => {
        'code': code,
        'name': name,
      };

  bool get isUsd => code.toLowerCase() == 'usd';
}
