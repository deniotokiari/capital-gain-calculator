library symbol_data;

export 'src/model/symbol.dart';
export 'src/repository//symbol_repository.dart';

import 'package:common/common.dart';
import 'package:symbol_data/src/repository/symbol_repository.dart';

class SymbolDataModule extends DependencyModule {
  @override
  void init() {
    registerLazySingleton<SymbolRepository>(() => SymbolRepository(get()));
  }
}
