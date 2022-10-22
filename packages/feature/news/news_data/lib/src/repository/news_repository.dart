import 'dart:math';

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
    final cache = await _localStorage.collection(
      NewsFeed.fromMap,
      where: (item) => _compare(NewsFeed.getTickers(item), tickers),
    );

    if (cache.isEmpty) {
      final to = DateTime.now();
      final from = to.add(const Duration(days: -7));
      final response = await Future.wait(tickers.map(
        (ticker) => _stockServiceApi
            .newsAndSentiment(
              from,
              to,
              tickers: [ticker],
              limit: 5,
            )
            .then((value) => Pair(ticker, value)),
      ));

      final result = response.toNewsFeed(tickers, from, to, 5);

      await _localStorage.save(result);

      return result;
    } else {
      final feed = cache.first;
      // force update in case
      return feed;
    }
  }
}

extension _NewsAndSentimentResponseExt on List<Pair<String, api.NewsAndSentimentResponse>> {
  NewsFeed toNewsFeed(
    List<String> tickers,
    DateTime from,
    DateTime to,
    int limit,
  ) {
    final feed = <NewsFeedItem>[];

    forEach((item) {
      for (var element in item.second.feed.take(limit)) {
        feed.add(NewsFeedItem(
          ticker: item.first,
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
