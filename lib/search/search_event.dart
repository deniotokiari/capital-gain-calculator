
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_event.freezed.dart';

@freezed
class SearchEvent with _$SearchEvent {
  factory SearchEvent.search(String query) = SearchEventSearch;

	factory SearchEvent.clear() = SearchEventClear;
}
