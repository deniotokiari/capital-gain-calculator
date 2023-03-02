import 'package:data_currency/currency.dart';
import 'package:data_stock/data_stock.dart';
import 'package:store/repository/db_repository.dart';
import 'package:data_symbol/src/model/symbol.dart';

class SymbolRepository extends DbRepository<Symbol> {
  final StockRemoteSource _stockRemoteSource;
  final CurrencyListRepository _currencyListRepository;

  SymbolRepository(
    this._stockRemoteSource,
    this._currencyListRepository,
    super.space,
    super.map,
    super.db,
  );

  Symbol getById(String id) => get(id);

  Stream<Iterable<Symbol>> getUpdates() => updates();

  Future<List<Symbol>> search(String query) async {
    final remoteResult = await _stockRemoteSource.searchSymbol(query);
    final result = <Symbol>[];

    for (final item in remoteResult.bestMatches) {
      result.add(Symbol(
        name: item.name,
        ticker: item.symbol,
        region: item.region,
        currency: await _currencyListRepository.getCurrencyByCode(item.currency),
        globalQuote: null,
      ));
    }

    return result;
  }

  Future<GlobalQuote?> globalQuote(String symbolId, {bool force = false}) async {
    final symbol = get(symbolId);

    if (force) {
      final response = await _stockRemoteSource.globalQuote(symbol.ticker);
      final globalQuote = GlobalQuote(
        open: CurrencyValue(value: double.parse(response.globalQuote.open), currency: symbol.currency),
        high: CurrencyValue(value: double.parse(response.globalQuote.high), currency: symbol.currency),
        low: CurrencyValue(value: double.parse(response.globalQuote.low), currency: symbol.currency),
        price: CurrencyValue(value: double.parse(response.globalQuote.price), currency: symbol.currency),
        close: CurrencyValue(value: double.parse(response.globalQuote.previousClose), currency: symbol.currency),
      );

      await add(Symbol(
        name: symbol.name,
        ticker: symbol.ticker,
        region: symbol.region,
        currency: symbol.currency,
        globalQuote: globalQuote,
      ));

      return globalQuote;
    } else {
      return symbol.globalQuote;
    }
  }
}
