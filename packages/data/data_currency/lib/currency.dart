library data_currency;

import 'package:data_currency/src/repository/currency_list_repository.dart';
import 'package:data_currency/src/source/alphavantage_currency_list_source.dart';
import 'package:data_currency/src/source/shared_prefs_currency_list_source.dart';
import 'package:utility/utility.dart';

export 'src/currency.dart';
export 'src/currency_value.dart';
export 'src/repository/currency_list_repository.dart';

class CurrencyModule extends DependencyModule {
  @override
  Future<void> init() async {
    registerLazySingleton(
      () => CurrencyListRepository(
        AlphavantageCurrencyListSource(),
        SharedPrefsCurrencyListSource(),
      ),
    );
  }
}
