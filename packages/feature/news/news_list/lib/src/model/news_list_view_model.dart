import 'package:news_data/news_data.dart';
import 'package:intl/intl.dart';

final _dateFormatter = DateFormat('HH:mm d MMMM yyyy');

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

  factory NewsListViewModel.fromNewsFeed(NewsFeed feed) => NewsListViewModel(
        news: [
          ...feed.feed.map((e) => NewsItemViewModel(
                ticker: e.ticker,
                title: e.title,
                summary: e.summary,
                url: e.url,
              ))
        ],
        newsHeader: 'News (last update ${_dateFormatter.format(feed.to)})',
        loading: false,
        refreshing: false,
      );
}

class NewsItemViewModel {
  final String ticker;
  final String title;
  final String summary;
  final String url;

  NewsItemViewModel({
    required this.ticker,
    required this.title,
    required this.summary,
    required this.url,
  });
}
