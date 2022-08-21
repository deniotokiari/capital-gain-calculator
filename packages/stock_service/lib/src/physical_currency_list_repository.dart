import 'package:stock_service/src/model/physical_currency.dart';

abstract class PhysicalCurrencyListRepository {
  Future<List<PhysicalCurrency>> getPhysicalCurrencyList();
}
