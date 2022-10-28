library physical_currency;

export 'src/model/physical_currency.dart';
export 'src/use_case/get_physical_currency_list_use_case.dart';
export 'src/use_case/get_physical_currency_by_id_use_case.dart';
export 'src/use_case/get_physical_currency_by_code_use_case.dart';
export 'src/use_case/get_portfolio_physical_currency_by_instrument_id_use_case.dart';

import 'package:common/common.dart';
import 'package:physical_currency/src/use_case/get_physical_currency_by_code_use_case.dart';
import 'package:physical_currency/src/use_case/get_physical_currency_by_id_use_case.dart';
import 'package:physical_currency/src/use_case/get_physical_currency_list_use_case.dart';
import 'package:physical_currency/src/use_case/get_portfolio_physical_currency_by_instrument_id_use_case.dart';

class PhysicalCurrencyModule extends DependencyModule {
  @override
  void init() {
    registerLazySingleton<GetPhysicalCurrencyListUseCase>(
      () => GetPhysicalCurrencyListUseCase(
        get(),
        get(),
      ),
    );
    registerLazySingleton<GetPhysicalCurrencyByIdUseCase>(
      () => GetPhysicalCurrencyByIdUseCase(
        get(),
      ),
    );
    registerFactory<GetPhysicalCurrencyByCodeUseCase>(
      () => GetPhysicalCurrencyByCodeUseCase(
        get(),
      ),
    );
    registerFactory<GetPortfolioPhysicalCurrencyByInstrumentIdUseCase>(
      () => GetPortfolioPhysicalCurrencyByInstrumentIdUseCase(
        get(),
        get(),
        get(),
      ),
    );
  }
}
