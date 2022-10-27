import 'package:common/common.dart';
import 'package:physical_currency/src/model/physical_currency.dart';
import 'package:physical_currency/src/use_case/get_physical_currency_list_use_case.dart';

class GetPhysicalCurrencyByIdUseCase implements UseCase<String, Future<PhysicalCurrency>> {
  final GetPhysicalCurrencyListUseCase _getPhysicalCurrencyListUseCase;

  GetPhysicalCurrencyByIdUseCase(this._getPhysicalCurrencyListUseCase);

  final Map<String, PhysicalCurrency> _map = {};

  @override
  Future<PhysicalCurrency> execute(String args) async {
    if (_map.containsKey(args)) {
      return _map[args]!;
    }

    final items = await _getPhysicalCurrencyListUseCase.execute(null);
    final item = items.firstWhere((element) => element.id == args);

    _map[args] = item;

    return item;
  }
}
