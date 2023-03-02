library feature_symbol_search;

import 'package:feature_symbol_search/src/bloc/symbol_search_bloc.dart';
import 'package:feature_symbol_search/src/widget/symbol_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:utility/utility.dart';

class FeatureSymbolSearchModule extends DependencyModule {
  @override
  Future<void> init() async {
    registerFactory(
      () => SymbolSearchBloc(
        get(),
      ),
    );
    registerFactory<Widget>(() => SymbolSearchWidget(), instanceName: 'symbol_search');
  }
}
