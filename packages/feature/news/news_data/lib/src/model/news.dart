class News {
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
}
