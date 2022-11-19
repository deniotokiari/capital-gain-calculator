import 'package:common/common.dart';
import 'package:db/db.dart' as db;

class GetInstrumentTickerUseCase
    implements
        UseCase<GetInstrumentTickerUseCaseArguments, Future<GetInstrumentTickerUseCaseResult>> {
  final db.InstrumentRepository _instrumentRepository;
  final db.SymbolRepository _symbolRepository;

  GetInstrumentTickerUseCase(
    this._instrumentRepository,
    this._symbolRepository,
  );

  @override
  Future<GetInstrumentTickerUseCaseResult> execute(GetInstrumentTickerUseCaseArguments args) async {
    final instrument = await _instrumentRepository.get(args.instrumentId);
    final symbol = await _symbolRepository.get(instrument.symbolId!);

    return GetInstrumentTickerUseCaseResult(symbol.ticker);
  }
}

class GetInstrumentTickerUseCaseArguments {
  final String instrumentId;

  GetInstrumentTickerUseCaseArguments({
    required this.instrumentId,
  });
}

class GetInstrumentTickerUseCaseResult {
  final String ticker;

  GetInstrumentTickerUseCaseResult(this.ticker);
}
