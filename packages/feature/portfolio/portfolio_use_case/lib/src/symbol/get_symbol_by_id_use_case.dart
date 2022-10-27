import 'package:common/common.dart';
import 'package:db/db.dart' as db;
import 'package:physical_currency/physical_currency.dart';
import 'package:portfolio_data/portfolio_data.dart';

class GetSymbolByIdUseCase implements UseCase<String, Future<Symbol>> {
  final db.SymbolRepository _symbolRepository;
  final GetPhysicalCurrencyByIdUseCase _getPhysicalCurrencyByIdUseCase;

  GetSymbolByIdUseCase(
    this._symbolRepository,
    this._getPhysicalCurrencyByIdUseCase,
  );

  @override
  Future<Symbol> execute(String args) async {
    final symbol = await _symbolRepository.get(args);

    return Symbol(
      id: symbol.id,
      name: symbol.name,
      ticker: symbol.ticker,
      region: symbol.region,
      physicalCurrency: await _getPhysicalCurrencyByIdUseCase.execute(symbol.physicalCurrencyId),
    );
  }
}
