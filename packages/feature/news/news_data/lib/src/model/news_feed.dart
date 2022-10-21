import 'package:common/common.dart';

class NewsFeed extends LocalStorageEntity {
  final List<String> tickers;
  final List<NewsFeedItem> feed;
  final DateTime from;
  final DateTime to;

  NewsFeed({
    required this.tickers,
    required this.feed,
    required this.from,
    required this.to,
  });

  static DateTime _convertFromString(String date) {
    final list = date.split('/');

    return DateTime(
      int.parse(list[0]),
      int.parse(list[1]),
      int.parse(list[2]),
      int.parse(list[3]),
      int.parse(list[4]),
    );
  }

  factory NewsFeed.fromMap(Map<String, dynamic> map) => NewsFeed(
        tickers: map['tickers'],
        feed: [...(map['feed'] as List<Map<String, dynamic>>).map(NewsFeedItem.fromMap)],
        from: _convertFromString(map['from']),
        to: _convertFromString(map['to']),
      );

  @override
  Iterable get itemsForId => [...tickers];

  @override
  Map<String, dynamic> get toMap => {
        'tickers': tickers,
        'feed': [...feed.map((e) => e.toMap)],
        'from': [from.year, from.month, from.day, from.hour, from.minute].join('/'),
        'to': [to.year, to.month, to.day, to.hour, to.minute].join('/'),
      };
}

class NewsFeedItem {
  NewsFeedItem();

  factory NewsFeedItem.fromMap(Map<String, dynamic> map) => NewsFeedItem();

  Map<String, dynamic> get toMap => {};
}
