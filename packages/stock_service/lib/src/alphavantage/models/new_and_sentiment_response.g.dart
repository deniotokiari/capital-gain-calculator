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
      (json['overallSentimentScore'] as num?)?.toDouble() ?? 0,
      json['summary'] as String? ?? '',
      json['timePublished'] as int? ?? 0,
      json['title'] as String? ?? '',
      json['url'] as String? ?? '',
    );

Map<String, dynamic> _$NewsFeedToJson(NewsFeed instance) => <String, dynamic>{
      'overallSentimentScore': instance.overallSentimentScore,
      'summary': instance.summary,
      'timePublished': instance.timePublished,
      'title': instance.title,
      'url': instance.url,
    };
