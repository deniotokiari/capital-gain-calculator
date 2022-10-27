import 'package:common/common.dart';
import 'package:db/db.dart' as db;
import 'package:physical_currency/physical_currency.dart';

class AddSymbolInstrumentUseCase
    implements UseCase<AddSymbolInstrumentUseCaseArguments, Future<void>> {
  final db.InstrumentRepository _instrumentRepository;
  final db.SymbolRepository _symbolRepository;
  final GetPhysicalCurrencyByCodeUseCase _getPhysicalCurrencyByCodeUseCase;

  AddSymbolInstrumentUseCase(
    this._instrumentRepository,
    this._symbolRepository,
    this._getPhysicalCurrencyByCodeUseCase,
  );

  @override
  Future<void> execute(AddSymbolInstrumentUseCaseArguments args) async {
    final symbolId = await _symbolRepository.add(db.Symbol(
      name: args.name,
      ticker: args.ticker,
      region: args.region,
      physicalCurrencyId: await _getPhysicalCurrencyByCodeUseCase.execute(args.currency).then(
            (value) => value.id,
          ),
    ));

    await _instrumentRepository.add(db.Instrument.symbol(
      portfolioId: args.portfolioId,
      symbolId: symbolId,
    ));
  }
}

class AddSymbolInstrumentUseCaseArguments {
  final String portfolioId;
  final String name;
  final String ticker;
  final String region;
  final String currency;

  AddSymbolInstrumentUseCaseArguments({
    required this.portfolioId,
    required this.name,
    required this.ticker,
    required this.region,
    required this.currency,
  });
}
