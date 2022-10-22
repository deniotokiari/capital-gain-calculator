import 'package:news_data/news_data.dart';
import 'package:intl/intl.dart';

final _dateFormatter = DateFormat.yMd().add_Hm();

class NewsListViewModel {
  final List<NewsItemViewModel> news;
  final String newsHeader;
  final bool loading;

  NewsListViewModel(this.news, this.newsHeader, this.loading);

  factory NewsListViewModel.initial() => NewsListViewModel([], 'News', true);

  factory NewsListViewModel.fromNewsFeed(NewsFeed feed) => NewsListViewModel(
        [
          ...feed.feed.map((e) => NewsItemViewModel(
                ticker: e.ticker,
                title: e.title,
                summary: e.summary,
                url: e.url,
              ))
        ],
        'News from ${_dateFormatter.format(feed.from)} to ${_dateFormatter.format(feed.to)}',
        false,
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
