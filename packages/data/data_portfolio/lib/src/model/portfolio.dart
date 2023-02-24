import 'package:data_currency/currency.dart';
import 'package:store/model/db_entity.dart';

class Portfolio extends DbEntity {
  final String name;
  final Currency currency;

  Portfolio(this.name, this.currency);

  @override
  Iterable get itemsForId => [name];

  @override
  Map<String, dynamic> get map => {
        'name': name,
        'currency': currency.toMap,
      };

  factory Portfolio.fromMap(Map<String, dynamic> map) => Portfolio(
        map['name'],
        Currency.fromMap(map['currency']),
      );
}
