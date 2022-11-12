import 'package:common/common.dart';
import 'package:db/db.dart' as db;
import 'package:portfolio_data/portfolio_data.dart';
import 'package:portfolio_use_case/src/symbol/get_symbol_by_id_use_case.dart';

class GetInstrumentsByPortfolioId implements UseCase<String, Future<List<Instrument>>> {
  final db.InstrumentRepository _instrumentRepository;
  final db.PositionRepository _positionRepository;
  final db.QuoteRepository _quoteRepository;
  final GetSymbolByIdUseCase _symbolByIdUseCase;

  GetInstrumentsByPortfolioId(
    this._instrumentRepository,
    this._positionRepository,
    this._quoteRepository,
    this._symbolByIdUseCase,
  );

  @override
  Future<List<Instrument>> execute(String args) async {
    final instruments = await _instrumentRepository.where((map) => map['portfolioId'] == args);
    final result = <Instrument>[];

    for (final item in instruments) {
      final positions = await _positionRepository.where((map) => map['instrumentId'] == item.id);
      final quote = await _quoteRepository
          .where((map) => map['symbolId'] == item.symbolId)
          .then((value) => value.isEmpty ? null : value.first);

      final count = positions.fold<double>(0, (p, e) => p + e.count);
      final invested = positions.fold<double>(0, (p, e) => p + e.price.value);
      final averagePrice = count == 0 ? 0.0 : invested / count;
      final lastPrice = quote?.previousClose.value ?? 0;
      final returnValue = lastPrice * count - invested;
      final returnPercent = invested == 0 ? 0.0 : returnValue / invested;

      result.add(Instrument(
        id: item.id,
        symbol: await _symbolByIdUseCase.execute(item.symbolId!),
        count: count,
        averagePrice: averagePrice,
        invested: invested,
        lastPrice: lastPrice,
        returnValue: returnValue,
        returnPercent: returnPercent,
      ));
    }

    return result;
  }
}
