library symbol_search;

import 'package:common/common.dart';
import 'package:symbol_search/src/bloc/symbol_search_bloc.dart';

class SymbolSearchModule extends DependencyModule {
  @override
  void init() {
    registerFactory<SymbolSearchBloc>(() => SymbolSearchBloc(get()));
  }
}
