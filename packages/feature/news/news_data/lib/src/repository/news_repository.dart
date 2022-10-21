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

  Future<List<NewsFeed>> getByTickers(List<String> tickers) async {
    final cache = await _localStorage
        .collection(NewsFeed.fromMap)
        .then((value) => [...value.where((element) => element.tickers == tickers)]);

    if (cache.isEmpty) {
      final now = DateTime.now();
      final response = await _stockServiceApi.newsAndSentiment(
        now.add(const Duration(days: 7)),
        now,
        tickers: tickers,
      );

    } else {}
  }
}
