library symbol_api;

export 'package:symbol_search/src/widget/symbol_search_widget.dart';
export 'package:symbol_data/src/model/symbol.dart';
export 'package:symbol_data/src/repository/symbol_repository.dart';

import 'package:common/common.dart';
import 'package:symbol_data/symbol_data.dart';
import 'package:symbol_search/symbol_search.dart';

class SymbolApiModule extends DependencyModule {
  @override
  void init() {
    for (var module in [
      SymbolDataModule(),
      SymbolSearchModule(),
    ]) {
      module.init();
    }
  }
}
