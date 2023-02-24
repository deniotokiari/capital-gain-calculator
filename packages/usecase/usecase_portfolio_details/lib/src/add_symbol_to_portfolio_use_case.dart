import 'package:data_instrument/data_instrument.dart';
import 'package:data_symbol/data_symbol.dart';
import 'package:utility/utility.dart';

class AddSymbolToPortfolioUseCase extends UseCase<AddSymbolToPortfolioUseCaseArguments, Future<AddSymbolToPortfolioUseCaseResult>> {
  final InstrumentRepository _instrumentRepository;
  final SymbolRepository _symbolRepository;

  AddSymbolToPortfolioUseCase(
    this._instrumentRepository,
    this._symbolRepository,
  );

  @override
  Future<AddSymbolToPortfolioUseCaseResult> execute(AddSymbolToPortfolioUseCaseArguments arg) async {
    bool force = false;

    try {
      await _symbolRepository.globalQuote(arg.symbol.id);
    } catch (_) {
      force = true;
    }

    await _symbolRepository.add(arg.symbol);
    await _instrumentRepository.add(Instrument(portfolioId: arg.portfolioId, symbolId: arg.symbol.id));
    await _symbolRepository.globalQuote(arg.symbol.id, force: force);

    return AddSymbolToPortfolioUseCaseResult();
  }
}

class AddSymbolToPortfolioUseCaseArguments {
  final String portfolioId;
  final Symbol symbol;

  AddSymbolToPortfolioUseCaseArguments({
    required this.portfolioId,
    required this.symbol,
  });
}

class AddSymbolToPortfolioUseCaseResult {}
