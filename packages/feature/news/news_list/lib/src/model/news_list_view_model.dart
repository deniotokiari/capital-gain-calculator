import 'package:news_data/news_data.dart';

class NewsListViewModel {
  final List<NewsItemViewModel> news;

  NewsListViewModel(this.news);

  factory NewsListViewModel.initial() => NewsListViewModel([]);

  factory NewsListViewModel.fromNewsFeed(NewsFeed feed) => NewsListViewModel([
        ...feed.feed.map((e) => NewsItemViewModel(
              ticker: e.ticker,
              title: e.title,
              summary: e.summary,
              url: e.url,
            ))
      ]);
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
