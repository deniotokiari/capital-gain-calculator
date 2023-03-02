import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:data_symbol/data_symbol.dart';

part 'symbol_search_state.freezed.dart';

@freezed
class SymbolSearchState with _$SymbolSearchState {
  factory SymbolSearchState.loading() = _SymbolSearchStateLoading;

  factory SymbolSearchState.result(List<Symbol> model) = SymbolSearchStateResult;
}
