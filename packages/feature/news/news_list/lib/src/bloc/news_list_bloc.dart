import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_data/news_data.dart';
import 'package:news_list/src/bloc/news_list_event.dart';
import 'package:news_list/src/bloc/news_list_state.dart';
import 'package:news_list/src/model/news_list_view_model.dart';

class NewsListBloc extends Bloc<NewsListEvent, NewsListState> {
  final NewsRepository _newsRepository;
  late List<String> _tickers;

  NewsListBloc(
    this._newsRepository,
  ) : super(NewsListState.idle(NewsListViewModel.initial())) {
    on<NewsListEventInit>((event, emit) async {
      _tickers = event.tickers;

      if (_tickers.isNotEmpty) {
        final news = await _newsRepository.getByTickers(_tickers);

        emit(NewsListState.idle(NewsListViewModel.fromNewsFeed(news)));
      }
    });
    on<NewsListEventRefresh>((event, emit) async {
      emit(NewsListState.idle(NewsListViewModel(
        news: state.model.news,
        newsHeader: state.model.newsHeader,
        loading: false,
        refreshing: true,
      )));

      emit(
        NewsListState.idle(
          NewsListViewModel.fromNewsFeed(
            await _newsRepository.refresh(_tickers),
          ),
        ),
      );
    });
  }
}
