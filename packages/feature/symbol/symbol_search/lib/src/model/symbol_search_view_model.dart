import 'package:stock_service/stock_service.dart';

class SymbolSearchViewModel {
  final List<SymbolSearchViewModelItem> symbols;

  SymbolSearchViewModel(this.symbols);
}

class SymbolSearchViewModelItem {
  final String name;
  final String symbol;
  final String region;
  final String currency;

  SymbolSearchViewModelItem(this.name, this.symbol, this.region, this.currency);

  factory SymbolSearchViewModelItem.fromSymbolSearchMatch(SymbolSearchMatch match) =>
      SymbolSearchViewModelItem(
        match.name,
        match.symbol,
        match.region,
        match.currency,
      );
}
