import 'package:common/common.dart';

class PortfolioInstrument extends LocalStorageEntity {
  final String portfolioId;
  final String? symbolId;
  final String? cryptoCurrencyId;

  PortfolioInstrument({
    required this.portfolioId,
    required this.symbolId,
    required this.cryptoCurrencyId,
  });

  factory PortfolioInstrument.symbol({
    required String portfolioId,
    required String symbolId,
  }) =>
      PortfolioInstrument(
        portfolioId: portfolioId,
        symbolId: symbolId,
        cryptoCurrencyId: null,
      );

  factory PortfolioInstrument.cryptoCurrency({
    required String portfolioId,
    required String cryptoCurrencyId,
  }) =>
      PortfolioInstrument(
        portfolioId: portfolioId,
        symbolId: null,
        cryptoCurrencyId: cryptoCurrencyId,
      );

  factory PortfolioInstrument.fromMap(Map<String, dynamic> map) => PortfolioInstrument(
        portfolioId: map['portfolioId'],
        symbolId: map['symbolId'],
        cryptoCurrencyId: map['cryptoCurrencyId'],
      );

  @override
  Iterable get itemsForId => [portfolioId, symbolId, cryptoCurrencyId];

  @override
  Map<String, dynamic> get toMap => {
        'portfolioId': portfolioId,
        'symbolId': symbolId,
        'cryptoCurrencyId': cryptoCurrencyId,
      };
}
