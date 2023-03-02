library data_symbol;

import 'package:data_symbol/src/repository/symbol_repository.dart';
import 'package:data_symbol/src/model/symbol.dart';
import 'package:store/common/space.dart';
import 'package:utility/utility.dart';

export 'src/model/symbol.dart';
export 'src/repository/symbol_repository.dart';

class DataSymbolModule extends DependencyModule {
  @override
  Future<void> init() async {
    registerLazySingleton(
      () => SymbolRepository(
        get(),
        get(),
        Space.common,
        Symbol.fromMap,
        get(),
      ),
    );
  }
}
