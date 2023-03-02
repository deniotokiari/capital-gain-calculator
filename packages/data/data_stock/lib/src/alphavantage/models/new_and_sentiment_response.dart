import 'package:json_annotation/json_annotation.dart';
import 'package:data_stock/src/models/news_and_sentiment_response.dart'
    as news_and_sentiment_response_interface;

part 'new_and_sentiment_response.g.dart';

@JsonSerializable()
class NewsAndSentimentResponse
    implements news_and_sentiment_response_interface.NewsAndSentimentResponse {
  @override
  @JsonKey(name: 'feed', defaultValue: [])
  final List<NewsFeed> feed;

  NewsAndSentimentResponse(this.feed);

  factory NewsAndSentimentResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsAndSentimentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsAndSentimentResponseToJson(this);
}

@JsonSerializable()
class NewsFeed implements news_and_sentiment_response_interface.NewsFeed {
  @override
  @JsonKey(name: 'overall_sentiment_score', defaultValue: 0)
  double overallSentimentScore;

  @override
  @JsonKey(name: 'summary', defaultValue: '')
  String summary;

  @override
  @JsonKey(name: 'time_published', defaultValue: '')
  String timePublished;

  @override
  @JsonKey(name: 'title', defaultValue: '')
  String title;

  @override
  @JsonKey(name: 'url', defaultValue: '')
  String url;

  NewsFeed(
    this.overallSentimentScore,
    this.summary,
    this.timePublished,
    this.title,
    this.url,
  );

  factory NewsFeed.fromJson(Map<String, dynamic> json) => _$NewsFeedFromJson(json);

  Map<String, dynamic> toJson() => _$NewsFeedToJson(this);
}