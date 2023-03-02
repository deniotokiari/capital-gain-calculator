import 'package:data_instrument/data_instrument.dart';
import 'package:data_symbol/data_symbol.dart';
import 'package:utility/utility.dart';

class GetSymbolByInstrumentIdUseCase
    extends UseCase<GetSymbolByInstrumentIdUseCaseArguments, Future<GetSymbolByInstrumentIdUseCaseResult>> {
  final InstrumentRepository _instrumentRepository;
  final SymbolRepository _symbolRepository;

  GetSymbolByInstrumentIdUseCase(
    this._instrumentRepository,
    this._symbolRepository,
  );

  @override
  Future<GetSymbolByInstrumentIdUseCaseResult> execute(GetSymbolByInstrumentIdUseCaseArguments arg) async {
    final instrument = _instrumentRepository.getById(arg.instrumentId);
    final symbol = _symbolRepository.getById(instrument.symbolId);

    return GetSymbolByInstrumentIdUseCaseResult(symbol);
  }
}

class GetSymbolByInstrumentIdUseCaseArguments {
  final String instrumentId;

  GetSymbolByInstrumentIdUseCaseArguments({
    required this.instrumentId,
  });
}

class GetSymbolByInstrumentIdUseCaseResult {
  final Symbol symbol;

  GetSymbolByInstrumentIdUseCaseResult(this.symbol);
}
