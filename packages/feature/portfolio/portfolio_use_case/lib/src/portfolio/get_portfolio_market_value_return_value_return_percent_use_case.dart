import 'package:common/common.dart';
import 'package:db/db.dart' as db;
import 'package:physical_currency/physical_currency.dart';
import 'package:portfolio_use_case/src/instrument/get_instrument_market_value_return_value_return_percent_use_case.dart';

class GetPortfolioMarketValueReturnValueReturnPercentUseCase
    implements
        UseCase<GetPortfolioMarketValueReturnValueReturnPercentUseCaseArguments,
            Future<GetPortfolioMarketValueReturnValueReturnPercentUseCaseResult?>> {
  final db.InstrumentRepository _instrumentRepository;
  final GetInstrumentMarketValueReturnValueReturnPercentUseCase
      _getInstrumentMarketValueReturnValueReturnPercentUseCase;

  GetPortfolioMarketValueReturnValueReturnPercentUseCase(
    this._instrumentRepository,
    this._getInstrumentMarketValueReturnValueReturnPercentUseCase,
  );

  @override
  Future<GetPortfolioMarketValueReturnValueReturnPercentUseCaseResult?> execute(
      GetPortfolioMarketValueReturnValueReturnPercentUseCaseArguments args) async {
    final instruments = await _instrumentRepository.where(
      (map) => map['portfolioId'] == args.portfolioId,
    );
    var marketValue = 0.0;
    var returnValue = 0.0;
    var invested = 0.0;
    PhysicalCurrency? physicalCurrency;

    for (final instrument in instruments) {
      final values = await _getInstrumentMarketValueReturnValueReturnPercentUseCase.execute(
        GetInstrumentMarketValueReturnValueReturnPercentUseCaseArguments(
          instrumentId: instrument.id,
        ),
      );

      if (values != null) {
        physicalCurrency ??= values.marketValue.currency;
        marketValue += values.marketValue.value;
        returnValue += values.returnValue.value;
        invested += values.invested.value;
      }
    }

    final returnPercent = invested > 0 ? (returnValue / invested) : .00;

    if (marketValue != 0 && physicalCurrency != null) {
      return GetPortfolioMarketValueReturnValueReturnPercentUseCaseResult(
        marketValue: PhysicalCurrencyValue(
          value: marketValue,
          currency: physicalCurrency,
        ),
        returnValue: PhysicalCurrencyValue(
          value: returnValue,
          currency: physicalCurrency,
        ),
        invested: PhysicalCurrencyValue(
          value: invested,
          currency: physicalCurrency,
        ),
        returnPercent: PercentValue(returnPercent),
      );
    } else {
      return null;
    }
  }
}

class GetPortfolioMarketValueReturnValueReturnPercentUseCaseArguments {
  final String portfolioId;

  GetPortfolioMarketValueReturnValueReturnPercentUseCaseArguments({
    required this.portfolioId,
  });
}

class GetPortfolioMarketValueReturnValueReturnPercentUseCaseResult {
  final PhysicalCurrencyValue marketValue;
  final PhysicalCurrencyValue returnValue;
  final PhysicalCurrencyValue invested;
  final PercentValue returnPercent;

  GetPortfolioMarketValueReturnValueReturnPercentUseCaseResult({
    required this.marketValue,
    required this.returnValue,
    required this.invested,
    required this.returnPercent,
  });
}
