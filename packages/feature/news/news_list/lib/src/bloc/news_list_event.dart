import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_list_event.freezed.dart';

@freezed
class NewsListEvent with _$NewsListEvent {
  factory NewsListEvent.init(List<String> tickers) = NewsListEventInit;

  factory NewsListEvent.refresh() = NewsListEventRefresh;
}
