library physical_currency;

import 'package:common/common.dart';
import 'package:physical_currency/src/repository/physical_currency_list_repository.dart';

export 'src/model/physical_currency.dart';
export 'src/repository/physical_currency_list_repository.dart';

class PhysicalCurrencyModule extends DependencyModule {
  @override
  void init() {
    registerLazySingleton<PhysicalCurrencyListRepository>(
      () => PhysicalCurrencyListRepository(
        get(),
        get(),
      ),
    );
  }
}
