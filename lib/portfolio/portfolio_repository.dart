import 'package:common/common.dart';

class PortfolioRepository {
  final LocalStorage _localStorage;
  final _portfolios = <Portfolio>[];

  PortfolioRepository(this._localStorage);

  Future<void> add(Portfolio portfolio) async {
    _portfolios.add(portfolio);

    await _localStorage.save(portfolio);
  }

  Future<List<Portfolio>> getAll() async {
    if (_portfolios.isNotEmpty) {
      return _portfolios.toList();
    }

    final localItems = await _localStorage.collection(Portfolio.fromMap);

    if (localItems != null) {
      _portfolios.addAll(localItems);
    }

    return _portfolios.toList();
  }
}

class Portfolio extends LocalStorageEntity {
  final String title;
  final String physicalCurrencyId;

  Portfolio({
    required this.title,
    required this.physicalCurrencyId,
  });

  factory Portfolio.fromMap(Map<String, dynamic> map) => Portfolio(
        title: map['title'],
        physicalCurrencyId: map['physicalCurrencyId'],
      );

  @override
  String get id => Object.hashAll([title, physicalCurrencyId]).toString();

  @override
  Map<String, dynamic> get toMap => {
        'title': title,
        'physicalCurrencyId': physicalCurrencyId,
      };
}
