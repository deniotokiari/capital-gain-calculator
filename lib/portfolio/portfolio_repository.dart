import 'package:common/common.dart';
import 'package:stock_service/stock_service.dart';

const String _portfolioRepositoryName = 'portfolioRepositoryName';

class PortfolioRepository {
  final LocalStorage _localStorage;
  final _portfolios = <Portfolio>[];

  PortfolioRepository(this._localStorage);

  Future<void> add(Portfolio portfolio) async {
    _portfolios.add(portfolio);

    await _localStorage.save(
      portfolio.toMap,
      name: _portfolioRepositoryName,
      id: portfolio.id,
    );
  }

  Future<List<Portfolio>> getAll() async {
    if (_portfolios.isNotEmpty) {
      return _portfolios.toList();
    }

    final localItems = await _localStorage.collection(_portfolioRepositoryName);

    if (localItems != null) {
      _portfolios.addAll(localItems.map((e) => Portfolio.fromMap(e)));
    }

    return _portfolios.toList();
  }
}

class PortfolioSymbol implements SymbolSearchMatch {
  final String portfolioId;

  @override
  final String currency;

  @override
  final String marketClose;

  @override
  final String marketOpen;

  @override
  final String matchScore;

  @override
  final String name;

  @override
  final String region;

  @override
  final String symbol;

  @override
  final String type;

  PortfolioSymbol({
    required this.portfolioId,
    required this.currency,
    required this.marketClose,
    required this.marketOpen,
    required this.matchScore,
    required this.name,
    required this.region,
    required this.symbol,
    required this.type,
  });

  String get id => Object.hashAll([
        portfolioId,
        currency,
        name,
        region,
        symbol,
        type,
      ]).toString();
}

class Portfolio {
  final String title;
  final String physicalCurrencyId;

  Portfolio({
    required this.title,
    required this.physicalCurrencyId,
  });

  String get id => Object.hashAll([title, physicalCurrencyId]).toString();

  factory Portfolio.fromMap(Map<String, dynamic> map) => Portfolio(
        title: map['title'],
        physicalCurrencyId: map['physicalCurrencyId'],
      );

  Map<String, dynamic> get toMap => {
        'title': title,
        'physicalCurrencyId': physicalCurrencyId,
      };
}
