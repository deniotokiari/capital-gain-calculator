import 'package:common/common.dart';
import 'package:physical_currency/physical_currency.dart';

class GetPhysicalCurrencyByCodeUseCase implements UseCase<String, Future<PhysicalCurrency>> {
  final GetPhysicalCurrencyListUseCase _getPhysicalCurrencyListUseCase;

  GetPhysicalCurrencyByCodeUseCase(this._getPhysicalCurrencyListUseCase);

  @override
  Future<PhysicalCurrency> execute(String args) async {
    final items = await _getPhysicalCurrencyListUseCase.execute(null);

    return items.firstWhere((item) => item.code == args);
  }
}
