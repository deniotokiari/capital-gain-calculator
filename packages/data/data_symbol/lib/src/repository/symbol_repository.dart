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

  Future<List<Symbol>> search(String query) async {
    final remoteResult = await _stockRemoteSource.searchSymbol(query);
    final result = <Symbol>[];

    for (final item in remoteResult.bestMatches) {
      result.add(Symbol(
        name: item.name,
        ticker: item.symbol,
        region: item.region,
        currency: await _currencyListRepository.getCurrencyByCode(item.currency),
      ));
    }

    return result;
  }
}
