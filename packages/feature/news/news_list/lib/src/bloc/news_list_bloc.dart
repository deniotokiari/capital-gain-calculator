import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/src/bloc/news_list_event.dart';
import 'package:news_list/src/bloc/news_list_state.dart';
import 'package:news_list/src/model/news_list_view_model.dart';
import 'package:news_use_case/news_use_case.dart';

class NewsListBloc extends Bloc<NewsListEvent, NewsListState> {
  final GetNewsByTickersUseCase _getNewsByTickersUseCase;

  late List<String> _tickers;

  NewsListBloc(
    this._getNewsByTickersUseCase,
  ) : super(NewsListState.idle(NewsListViewModel.initial())) {
    on<NewsListEventInit>((event, emit) async {
      _tickers = event.tickers;

      if (_tickers.isNotEmpty) {
        final news = await _getNewsByTickersUseCase.execute(
          GetNewsByTickersUseCaseArguments(
            force: false,
            tickers: _tickers,
          ),
        );

        emit(NewsListState.idle(NewsListViewModel.fromNews(news)));
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
          NewsListViewModel.fromNews(
            await _getNewsByTickersUseCase.execute(
              GetNewsByTickersUseCaseArguments(
                force: true,
                tickers: _tickers,
              ),
            ),
          ),
        ),
      );
    });
  }
}
