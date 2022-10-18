import 'package:freezed_annotation/freezed_annotation.dart';

part 'symbol_search_event.freezed.dart';

@freezed
class SymbolSearchEvent with _$SymbolSearchEvent {
  factory SymbolSearchEvent.search(String query) = SymbolSearchEventSearch;

	factory SymbolSearchEvent.clear() = SymbolSearchEventClear;
}
