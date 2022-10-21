import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:physical_currency/physical_currency.dart';
import 'package:portfolio_data/portfolio_data.dart';
import 'package:symbol_api/symbol_api.dart';

part 'get_portfolio_instruments_use_case.freezed.dart';

class GetPortfolioInstrumentsUseCase implements UseCase<String, List<PortfolioInstrument>> {
  final PhysicalCurrencyListRepository _physicalCurrencyListRepository;
  final SymbolRepository _symbolRepository;
  final PortfolioInstrumentRepository _portfolioInstrumentRepository;

  final List<PhysicalCurrency> _physicalCurrencyList = [];

  GetPortfolioInstrumentsUseCase(
    this._physicalCurrencyListRepository,
    this._symbolRepository,
    this._portfolioInstrumentRepository,
  );

  @override
  Future<Result<List<PortfolioInstrument>>> execute(String id) => runCatchingAsync(() async {
        if (_physicalCurrencyList.isEmpty) {
          _physicalCurrencyList
              .addAll(await _physicalCurrencyListRepository.getPhysicalCurrencyList());
        }

        final instruments = await _portfolioInstrumentRepository.getByPortfolioId(id);
        final symbols = await _symbolRepository
            .getItemsById(instruments.mapNotNull((instrument) => instrument.symbolId));

        return symbols
            .map(
              (symbol) => PortfolioInstrument.symbol(
                symbol,
                instruments.firstWhere((element) => element.symbolId == symbol.id).id,
                _physicalCurrencyList
                    .firstWhere((currency) => currency.id == symbol.physicalCurrencyId),
              ),
            )
            .toList(growable: false);
      });
}

@freezed
class PortfolioInstrument with _$PortfolioInstrument {
  factory PortfolioInstrument.symbol(
    Symbol symbol,
    String instrumentId,
    PhysicalCurrency currency,
  ) = _PortfolioInstrumentSymbol;
}
