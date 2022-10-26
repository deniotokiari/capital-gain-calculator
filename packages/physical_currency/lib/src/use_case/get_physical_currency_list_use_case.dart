import 'package:common/common.dart';
import 'package:db/db.dart' as db;
import 'package:stock_service/stock_service.dart';

class GetPhysicalCurrencyListUseCase implements UseCase<void, List<PhysicalCurrency>> {
  final StockServiceApi _stockServiceApi;
  final db.PhysicalCurrencyRepository _physicalCurrencyRepository;

  GetPhysicalCurrencyListUseCase(
    this._stockServiceApi,
    this._physicalCurrencyRepository,
  );

  final List<PhysicalCurrency> _items = [];

  @override
  Future<Result<List<PhysicalCurrency>>> execute(void args) => runCatchingAsync(() async {
        if (_items.isEmpty) {
          final cacheResult = await _physicalCurrencyRepository.all();

          if (cacheResult.isEmpty) {
            final remoteResult = await _stockServiceApi.physicCurrencyList();

            if (remoteResult.list.isNotEmpty) {
              final items = remoteResult.list.map(
                (e) => db.PhysicalCurrency(
                  code: e.code,
                  name: e.name,
                ),
              );

              await _physicalCurrencyRepository.addAll(items);

              _items.addAll([
                ...items.map(
                  (e) => PhysicalCurrency(
                    id: e.id,
                    code: e.code,
                    name: e.name,
                    isUsd: e.code.toLowerCase() == 'usd',
                  ),
                )
              ]);
            }
          } else {
            _items.addAll([
              ...cacheResult.map(
                (e) => PhysicalCurrency(
                  id: e.id,
                  code: e.code,
                  name: e.name,
                  isUsd: e.code.toLowerCase() == 'usd',
                ),
              )
            ]);
          }
        }

        return _items;
      });
}

class PhysicalCurrency {
  final String id;
  final String code;
  final String name;
  final bool isUsd;

  PhysicalCurrency({
    required this.id,
    required this.code,
    required this.name,
    required this.isUsd,
  });
}
