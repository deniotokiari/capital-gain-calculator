import 'package:intl/intl.dart';
import 'package:news_data/news_data.dart';

final _dateFormatter = DateFormat('d MMMM yyyy - HH:mm');

class NewsListViewModel {
  final List<NewsItemViewModel> news;
  final String newsHeader;
  final bool loading;
  final bool refreshing;

  NewsListViewModel({
    required this.news,
    required this.newsHeader,
    required this.loading,
    required this.refreshing,
  });

  factory NewsListViewModel.initial() => NewsListViewModel(
        news: [],
        newsHeader: 'News',
        loading: true,
        refreshing: false,
      );

  factory NewsListViewModel.fromNews(List<News> news) => NewsListViewModel(
        news: [
          ...news.map((e) => NewsItemViewModel(
                ticker: e.ticker,
                title: e.title,
                summary: e.summary,
                url: e.url,
                publishedIn: _dateFormatter.format(e.timePublished),
              ))
        ],
        newsHeader: 'News',
        loading: false,
        refreshing: false,
      );
}

class NewsItemViewModel {
  final String ticker;
  final String title;
  final String summary;
  final String url;
  final String publishedIn;

  NewsItemViewModel({
    required this.ticker,
    required this.title,
    required this.summary,
    required this.url,
    required this.publishedIn,
  });

  @override
  int get hashCode => Object.hash(
        ticker,
        title,
        summary,
        url,
        publishedIn,
      );

  @override
  bool operator ==(Object other) {
    if (other is NewsItemViewModel) {
      return ticker == other.ticker &&
          title == other.title &&
          summary == other.summary &&
          url == other.url &&
          publishedIn == other.publishedIn;
    }

    return false;
  }
}
