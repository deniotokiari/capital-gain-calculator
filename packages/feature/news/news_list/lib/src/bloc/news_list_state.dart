import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_list/src/model/news_list_view_model.dart';

part 'news_list_state.freezed.dart';

@freezed
class NewsListState with _$NewsListState {
  factory NewsListState.idle(NewsListViewModel model) = _NewsListStateIdle;
}
