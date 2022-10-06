import 'package:capital_gain_calculator/portfolio/portfolio_repository.dart';
import 'package:common/common.dart';
import 'package:stock_service/stock_service.dart';

class PortfolioSymbolRepository {
  final LocalStorage _localStorage;

  PortfolioSymbolRepository(this._localStorage);

  Future<void> add(PortfolioSymbol symbol) {
    return _localStorage.save(symbol);
  }

  Future<List<PortfolioSymbol>> getAll(Portfolio portfolio) async {
    final result = await _localStorage.collection(PortfolioSymbol.fromMap);

    return result
            ?.where((element) => element.portfolioId == portfolio.id)
            .toList(growable: false) ??
        [];
  }
}

class PortfolioSymbol extends LocalStorageEntity implements SymbolSearchMatch {
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

  factory PortfolioSymbol.fromMap(Map<String, dynamic> map) => PortfolioSymbol(
        portfolioId: map['portfolioId'],
        currency: map['currency'],
        marketClose: map['marketClose'],
        marketOpen: map['marketOpen'],
        matchScore: map['matchScore'],
        name: map['name'],
        region: map['region'],
        symbol: map['symbol'],
        type: map['type'],
      );

  @override
  String get id => Object.hashAll([
        portfolioId,
        currency,
        name,
        region,
        symbol,
        type,
      ]).toString();

  @override
  Map<String, dynamic> get toMap => {
        'portfolioId': portfolioId,
        'currency': currency,
        'marketClose': marketClose,
        'marketOpen': marketOpen,
        'matchScore': matchScore,
        'name': name,
        'region': region,
        'symbol': symbol,
        'type': type,
      };
}
