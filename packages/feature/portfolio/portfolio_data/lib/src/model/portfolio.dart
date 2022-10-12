import 'package:common/common.dart';

class Portfolio extends LocalStorageEntity {
  String name;
  String physicalCurrencyId;

  Portfolio({
    required this.name,
    required this.physicalCurrencyId,
  });

  factory Portfolio.fromMap(Map<String, dynamic> map) => Portfolio(
        name: map['name'],
        physicalCurrencyId: map['physicalCurrencyId'],
      );

  @override
  Iterable get itemsForId => [name, physicalCurrencyId];

  @override
  Map<String, dynamic> get toMap => {
        'name': name,
        'physicalCurrencyId': physicalCurrencyId,
      };
}
