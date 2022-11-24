import 'package:db/src/common/db_entity.dart';
import 'package:db/src/common/db_repository.dart';
import 'package:intl/intl.dart';

final _dateFormatter = DateFormat('d MMMM yyyy HH mm');

class News extends DbEntity {
  final String ticker;
  final String title;
  final String url;
  final DateTime timePublished;
  final String summary;
  final double overallSentimentScore;

  News({
    required this.ticker,
    required this.title,
    required this.url,
    required this.timePublished,
    required this.summary,
    required this.overallSentimentScore,
  });

  factory News.fromMap(Map<String, dynamic> map) => News(
        ticker: map['ticker'],
        title: map['title'],
        url: map['url'],
        timePublished: _dateFormatter.parse(map['timePublished']),
        summary: map['summary'],
        overallSentimentScore: map['overallSentimentScore'],
      );

  factory News.empty(String ticker) => News(
        ticker: ticker,
        title: '',
        url: '',
        timePublished: DateTime.now(),
        summary: '',
        overallSentimentScore: 0,
      );

  @override
  Iterable get itemsForId => [
        ticker,
        title,
        url,
        _dateFormatter.format(timePublished),
        summary,
        overallSentimentScore,
      ];

  @override
  Map<String, dynamic> get toMap => {
        'ticker': ticker,
        'title': title,
        'url': url,
        'timePublished': _dateFormatter.format(timePublished),
        'summary': summary,
        'overallSentimentScore': overallSentimentScore,
      };
}

class NewsRepository extends DbRepository<News> {
  @override
  News converter(Map<String, dynamic> map) => News.fromMap(map);
}
