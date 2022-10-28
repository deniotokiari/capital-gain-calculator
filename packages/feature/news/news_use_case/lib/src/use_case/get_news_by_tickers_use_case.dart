import 'package:common/common.dart';
import 'package:db/db.dart' as db;
import 'package:news_data/news_data.dart';
import 'package:stock_service/stock_service.dart';

class GetNewsByTickersUseCase
    implements UseCase<GetNewsByTickersUseCaseArguments, Future<List<News>>> {
  final StockServiceApi _stockServiceApi;
  final db.NewsRepository _newsRepository;

  GetNewsByTickersUseCase(
    this._stockServiceApi,
    this._newsRepository,
  );

  @override
  Future<List<News>> execute(GetNewsByTickersUseCaseArguments args) async {
    final news = await Future.wait(
      args.tickers.map((e) => _newsForTicker(ticker: e, force: args.force)),
    );

    return [for (final item in news) ...item];
  }

// // 20221027T123000
  DateTime _parseDataTime(String dateTime) => DateTime(
    int.parse(dateTime.substring(0, 5)),
    int.parse(dateTime.substring(4, 6)),
    int.parse(dateTime.substring(5, 7)),
    int.parse(dateTime.substring(9, 11)),
    int.parse(dateTime.substring(10, 12)),
  );

  Future<List<News>> _newsForTicker({
    required String ticker,
    required bool force,
  }) async {
    var fromCache = await _newsRepository.where((data) => data['ticker'] == ticker);

    if (fromCache.isEmpty || force) {
      final List<db.News> fromRemote = await runCatchingAsync(
        () => _stockServiceApi.newsAndSentiment(tickers: [ticker], limit: 5),
      ).then(
        (value) => value.map(
          success: (success) => [
            ...success.data.feed.take(5).map(
              (e) => db.News(
                ticker: ticker,
                title: e.title,
                url: e.url,
                timePublished: _parseDataTime(e.timePublished),
                summary: e.summary,
                overallSentimentScore: e.overallSentimentScore,
              ),
            ),
          ],
          failed: (_) => [],
        ),
      );

      if (fromRemote.isNotEmpty) {
        await _newsRepository.delete(fromCache);
        await _newsRepository.addAll(fromRemote);

        fromCache = fromRemote;
      }
    }

    return [
      ...fromCache.map((e) => News(
            ticker: ticker,
            title: e.title,
            url: e.url,
            timePublished: e.timePublished,
            summary: e.summary,
            overallSentimentScore: e.overallSentimentScore,
          ))
    ];
  }
}

class GetNewsByTickersUseCaseArguments {
  final bool force;
  final List<String> tickers;

  GetNewsByTickersUseCaseArguments({
    required this.force,
    required this.tickers,
  });
}
