import 'package:db/src/common/db_entity.dart';
import 'package:db/src/common/db_repository.dart';

class PhysicalCurrency extends DbEntity {
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
  Iterable get itemsForId => [code, name];

  @override
  Map<String, dynamic> get toMap => {
        'code': code,
        'name': name,
      };
}

class PhysicalCurrencyRepository extends DbRepository<PhysicalCurrency> {
  @override
  PhysicalCurrency converter(Map<String, dynamic> map) => PhysicalCurrency.fromMap(map);
}
