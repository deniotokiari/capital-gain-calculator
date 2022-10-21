abstract class NewsAndSentimentResponse {
  abstract final List<NewsFeed> feed;
}

abstract class NewsFeed {
  abstract final String title;
  abstract final String url;
  abstract final int timePublished;
  abstract final String summary;
  abstract final double overallSentimentScore;
}
