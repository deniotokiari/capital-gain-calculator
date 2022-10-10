import 'package:common/common.dart';

class PortfolioPositionsRepository {
  final LocalStorage _localStorage;

  PortfolioPositionsRepository(
    this._localStorage,
  );

  Future<void> add(PortfolioPosition position) {
    return _localStorage.save(position);
  }

  Future<List<PortfolioPosition>> getPositions(String portfolioId) {
    return _localStorage.collection(PortfolioPosition.fromMap).then(
          (value) =>
              value
                  ?.where(
                    (element) => element.portfolioId == portfolioId,
                  )
                  .toList(growable: false) ??
              [],
        );
  }
}

class PortfolioPosition extends LocalStorageEntity {
  final String portfolioId;
  final String symbolId;

  PortfolioPosition({
    required this.portfolioId,
    required this.symbolId,
  });

  factory PortfolioPosition.fromMap(Map<String, dynamic> map) => PortfolioPosition(
        portfolioId: map['portfolioId'],
        symbolId: map['symbolId'],
      );

  @override
  String get id => Object.hashAll([
        portfolioId,
        symbolId,
      ]).toString();

  @override
  Map<String, dynamic> get toMap => {
        'portfolioId': portfolioId,
        'symbolId': symbolId,
      };
}
