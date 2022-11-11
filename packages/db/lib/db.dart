library db;

export 'package:db/src/instrument.dart';
export 'package:db/src/news.dart';
export 'package:db/src/physical_currency.dart';
export 'package:db/src/portfolio.dart';
export 'package:db/src/position.dart';
export 'package:db/src/symbol.dart';
export 'package:db/src/physical_currency_value.dart';
export 'src/quote.dart';

import 'package:common/common.dart';
import 'package:db/src/instrument.dart';
import 'package:db/src/news.dart';
import 'package:db/src/physical_currency.dart';
import 'package:db/src/portfolio.dart';
import 'package:db/src/position.dart';
import 'package:db/src/quote.dart';
import 'package:db/src/symbol.dart';

class DbModule extends DependencyModule {
  @override
  void init() {
    registerLazySingleton<InstrumentRepository>(() => InstrumentRepository());
    registerLazySingleton<NewsRepository>(() => NewsRepository());
    registerLazySingleton<PhysicalCurrencyRepository>(() => PhysicalCurrencyRepository());
    registerLazySingleton<PortfolioRepository>(() => PortfolioRepository());
    registerLazySingleton<PositionRepository>(() => PositionRepository());
    registerLazySingleton<SymbolRepository>(() => SymbolRepository());
    registerLazySingleton<QuoteRepository>(() => QuoteRepository());
  }
}
