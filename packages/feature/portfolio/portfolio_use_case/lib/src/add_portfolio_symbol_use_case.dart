import 'package:common/common.dart';
import 'package:physical_currency/physical_currency.dart';
import 'package:portfolio_data/portfolio_data.dart';
import 'package:symbol_api/symbol_api.dart';

class AddPortfolioSymbolUseCase implements UseCase<AddPortfolioSymbolArguments, void> {
  final PhysicalCurrencyListRepository _physicalCurrencyListRepository;
  final SymbolRepository _symbolRepository;
  final PortfolioInstrumentRepository _portfolioInstrumentRepository;

  final List<PhysicalCurrency> _physicalCurrencyList = [];

  AddPortfolioSymbolUseCase(
    this._physicalCurrencyListRepository,
    this._symbolRepository,
    this._portfolioInstrumentRepository,
  );

  @override
  Future<Result<void>> execute(AddPortfolioSymbolArguments args) => runCatchingAsync(() async {
        if (_physicalCurrencyList.isEmpty) {
          _physicalCurrencyList
              .addAll(await _physicalCurrencyListRepository.getPhysicalCurrencyList());
        }

        final symbol = Symbol(
          name: args.name,
          symbol: args.symbol,
          region: args.region,
          physicalCurrencyId:
              _physicalCurrencyList.firstWhere((element) => element.code == args.currency).id,
        );

        // save symbol
        await _symbolRepository.add(symbol);

        // save portfolio instrument
        await _portfolioInstrumentRepository.add(PortfolioInstrument.symbol(
          portfolioId: args.portfolioId,
          symbolId: symbol.id,
        ));
      });
}

class AddPortfolioSymbolArguments {
  final String portfolioId;
  final String name;
  final String symbol;
  final String region;
  final String currency;

  AddPortfolioSymbolArguments({
    required this.portfolioId,
    required this.name,
    required this.symbol,
    required this.region,
    required this.currency,
  });
}
