import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:symbol_search/src/model/symbol_search_view_model.dart';

part 'symbol_search_state.freezed.dart';

@freezed
class SymbolSearchState with _$SymbolSearchState {
  factory SymbolSearchState.initial() = _SymbolSearchStateInitial;

  factory SymbolSearchState.loading() = _SymbolSearchStateLoading;

  factory SymbolSearchState.result(SymbolSearchViewModel result) = _SymbolSearchStateResult;

  factory SymbolSearchState.error() = _SymbolSearchStateError;
}
