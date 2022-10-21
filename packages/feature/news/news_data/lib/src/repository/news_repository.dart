import 'package:common/common.dart';
import 'package:news_data/news_data.dart';
import 'package:stock_service/stock_service.dart' as api;

class NewsRepository {
  final api.StockServiceApi _stockServiceApi;
  final LocalStorage _localStorage;

  NewsRepository(
    this._stockServiceApi,
    this._localStorage,
  );

  Future<void> add(NewsFeed feed) => _localStorage.save(feed);

  bool _compare(List<String> a, List<String> b) {
    if (a.length != b.length) {
      return false;
    }

    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) {
        return false;
      }
    }

    return true;
  }

  Future<NewsFeed> getByTickers(List<String> tickers) async {
    final cache = await _localStorage
        .collection(NewsFeed.fromMap)
        .then((value) => [...value.where((element) => _compare(element.tickers, tickers))]);

    if (cache.isEmpty) {
      final to = DateTime.now();
      final from = to.add(const Duration(days: -7));
      final response = await Future.wait(tickers.map((ticker) => _stockServiceApi.newsAndSentiment(
            from,
            to,
            tickers: [ticker],
            limit: 10,
          )));

      final result = response.toNewsFeed(tickers, from, to);

      await _localStorage.save(result);

      return result;
    } else {
      final feed = cache.first;
      // force update in case
      return feed;
    }
  }
}

extension _NewsAndSentimentResponseExt on List<api.NewsAndSentimentResponse> {
  NewsFeed toNewsFeed(
    List<String> tickers,
    DateTime from,
    DateTime to,
  ) {
    final feed = <NewsFeedItem>[];

    forEach((item) {
      for (var element in item.feed) {
        feed.add(NewsFeedItem(
          title: element.title,
          url: element.url,
          timePublished: element.timePublished,
          summary: element.summary,
          overallSentimentScore: element.overallSentimentScore,
        ));
      }
    });

    return NewsFeed(
      tickers: tickers,
      feed: feed,
      from: from,
      to: to,
    );
  }
}
