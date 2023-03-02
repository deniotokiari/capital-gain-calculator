// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_and_sentiment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsAndSentimentResponse _$NewsAndSentimentResponseFromJson(
        Map<String, dynamic> json) =>
    NewsAndSentimentResponse(
      (json['feed'] as List<dynamic>?)
              ?.map((e) => NewsFeed.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$NewsAndSentimentResponseToJson(
        NewsAndSentimentResponse instance) =>
    <String, dynamic>{
      'feed': instance.feed,
    };

NewsFeed _$NewsFeedFromJson(Map<String, dynamic> json) => NewsFeed(
      (json['overall_sentiment_score'] as num?)?.toDouble() ?? 0,
      json['summary'] as String? ?? '',
      json['time_published'] as String? ?? '',
      json['title'] as String? ?? '',
      json['url'] as String? ?? '',
    );

Map<String, dynamic> _$NewsFeedToJson(NewsFeed instance) => <String, dynamic>{
      'overall_sentiment_score': instance.overallSentimentScore,
      'summary': instance.summary,
      'time_published': instance.timePublished,
      'title': instance.title,
      'url': instance.url,
    };
