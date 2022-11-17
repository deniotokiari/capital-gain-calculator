import 'package:common/common.dart';
import 'package:db/db.dart' as db;
import 'package:physical_currency/physical_currency.dart';
import 'package:portfolio_use_case/portfolio_use_case.dart';
import 'package:portfolio_use_case/src/quote/get_quote_by_symbol_id_use_case.dart';

class GetPortfolioMarketValueUseCase
    implements
        UseCase<GetPortfolioMarketValueUseCaseArguments,
            Future<GetPortfolioMarketValueUseCaseResult>> {
  final db.PortfolioRepository _portfolioRepository;
  final db.InstrumentRepository _instrumentRepository;
  final db.SymbolRepository _symbolRepository;
  final GetPhysicalCurrencyByIdUseCase _getPhysicalCurrencyByIdUseCase;
  final GetInstrumentTotalSharesUseCase _getInstrumentTotalSharesUseCase;
  final GetQuoteBySymbolIdUseCase _getQuoteBySymbolIdUseCase;

  GetPortfolioMarketValueUseCase(
    this._portfolioRepository,
    this._instrumentRepository,
    this._symbolRepository,
    this._getPhysicalCurrencyByIdUseCase,
    this._getInstrumentTotalSharesUseCase,
    this._getQuoteBySymbolIdUseCase,
  );

  @override
  Future<GetPortfolioMarketValueUseCaseResult> execute(
      GetPortfolioMarketValueUseCaseArguments args) async {
    final portfolio = await _portfolioRepository.get(args.portfolioId);
    final portfolioPhysicalCurrency =
        await _getPhysicalCurrencyByIdUseCase.execute(portfolio.physicalCurrencyId);
    final portfolioInstruments =
        await _instrumentRepository.where((map) => map['portfolioId'] == portfolio.id);

    double result = 0;

    for (final instrument in portfolioInstruments) {
      final instrumentSymbol = await _symbolRepository.get(instrument.symbolId.require);
      final sharesCount = await _getInstrumentTotalSharesUseCase.execute(instrument.id);
      final lastMarketPrice = await _getQuoteBySymbolIdUseCase.execute(
        GetQuoteBySymbolIdUseCaseArguments(
          symbolId: instrumentSymbol.id,
        ),
      );
      final convertValue = await _getConvertValue(
        portfolio: portfolioPhysicalCurrency,
        quote: lastMarketPrice.quote.previousClose.currency,
      );

      result += sharesCount * (lastMarketPrice.quote.previousClose.value * convertValue);
    }

    return GetPortfolioMarketValueUseCaseResult(
      PhysicalCurrencyValue(
        value: result,
        currency: portfolioPhysicalCurrency,
      ),
    );
  }

  Future<double> _getConvertValue({
    required PhysicalCurrency portfolio,
    required PhysicalCurrency quote,
  }) async {
    return 1;
  }
}

class GetPortfolioMarketValueUseCaseArguments {
  final String portfolioId;

  GetPortfolioMarketValueUseCaseArguments({
    required this.portfolioId,
  });
}

class GetPortfolioMarketValueUseCaseResult {
  PhysicalCurrencyValue value;

  GetPortfolioMarketValueUseCaseResult(this.value);
}
