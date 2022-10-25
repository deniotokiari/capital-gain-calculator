import 'package:db/src/common/db_entity.dart';
import 'package:db/src/common/db_repository.dart';

class Portfolio extends DbEntity {
  final String name;
  final String physicalCurrencyId;

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

class PortfolioRepository extends DbRepository<Portfolio> {
  @override
  Portfolio converter(Map<String, dynamic> map) => Portfolio.fromMap(map);
}
