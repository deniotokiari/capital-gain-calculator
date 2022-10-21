import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_data/news_data.dart';
import 'package:news_list/src/bloc/news_list_event.dart';
import 'package:news_list/src/bloc/news_list_state.dart';
import 'package:news_list/src/model/news_list_view_model.dart';

class NewsListBloc extends Bloc<NewsListEvent, NewsListState> {
  final NewsRepository _newsRepository;

  NewsListBloc(
    this._newsRepository,
  ) : super(NewsListState.idle(NewsListViewModel.initial())) {
    on<NewsListEventInit>((event, emit) async {
      if (event.tickers.isNotEmpty) {
        final news = await _newsRepository.getByTickers(event.tickers);

        emit(NewsListState.idle(NewsListViewModel.fromNewsFeed(news)));
      }
    });
    on<NewsListEventRefresh>((event, emit) {});
  }
}
