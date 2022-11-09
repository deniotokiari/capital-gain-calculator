import 'package:common/common.dart';
import 'package:db/db.dart' as db;
import 'package:portfolio_data/portfolio_data.dart';
import 'package:portfolio_use_case/src/instrument/get_instrument_average_price_use_case.dart';
import 'package:portfolio_use_case/src/instrument/get_instrument_total_shares_use_case.dart';
import 'package:portfolio_use_case/src/symbol/get_symbol_by_id_use_case.dart';

class GetInstrumentsByPortfolioId implements UseCase<String, Future<List<Instrument>>> {
  final db.InstrumentRepository _instrumentRepository;
  final GetSymbolByIdUseCase _symbolByIdUseCase;
  final GetInstrumentTotalSharesUseCase _getInstrumentTotalSharesUseCase;
  final GetInstrumentAveragePriceUseCase _getInstrumentAveragePriceUseCase;

  GetInstrumentsByPortfolioId(
    this._instrumentRepository,
    this._symbolByIdUseCase,
    this._getInstrumentTotalSharesUseCase,
    this._getInstrumentAveragePriceUseCase,
  );

  @override
  Future<List<Instrument>> execute(String args) async {
    final instruments = await _instrumentRepository.where((map) => map['portfolioId'] == args);
    final result = <Instrument>[];

    for (final item in instruments) {
      result.add(Instrument(
        id: item.id,
        symbol: await _symbolByIdUseCase.execute(item.symbolId!),
        count: await _getInstrumentTotalSharesUseCase.execute(item.id),
        averagePrice: await _getInstrumentAveragePriceUseCase.execute(item.id),
      ));
    }

    return result;
  }
}
