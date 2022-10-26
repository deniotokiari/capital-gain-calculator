library physical_currency;

export 'src/use_case/get_physical_currency_list_use_case.dart';

import 'package:common/common.dart';
import 'package:physical_currency/src/use_case/get_physical_currency_list_use_case.dart';

class PhysicalCurrencyModule extends DependencyModule {
  @override
  void init() {
    registerLazySingleton<GetPhysicalCurrencyListUseCase>(
      () => GetPhysicalCurrencyListUseCase(
        get(),
        get(),
      ),
    );
  }
}
