import 'package:common/common.dart';
import 'package:db/db.dart' as db;
import 'package:physical_currency/physical_currency.dart';
import 'package:portfolio_use_case/src/position/get_position_market_value_return_value_return_percent_use_case.dart.dart';

class GetInstrumentMarketValueReturnValueReturnPercentUseCase
    implements
        UseCase<GetInstrumentMarketValueReturnValueReturnPercentUseCaseArguments,
            Future<GetInstrumentMarketValueReturnValueReturnPercentUseCaseResult?>> {
  final db.PositionRepository _positionRepository;
  final GetPositionMarketValueReturnValueReturnPercentUseCase
      _getPositionMarketValueReturnValueReturnPercentUseCase;

  GetInstrumentMarketValueReturnValueReturnPercentUseCase(
    this._positionRepository,
    this._getPositionMarketValueReturnValueReturnPercentUseCase,
  );

  @override
  Future<GetInstrumentMarketValueReturnValueReturnPercentUseCaseResult?> execute(
      GetInstrumentMarketValueReturnValueReturnPercentUseCaseArguments args) async {
    final positions = await _positionRepository.where(
      (map) => map['instrumentId'] == args.instrumentId,
    );
    var marketValue = 0.0;
    var returnValue = 0.0;
    var invested = 0.0;
    PhysicalCurrency? physicalCurrency;

    for (final position in positions) {
      final values = await _getPositionMarketValueReturnValueReturnPercentUseCase.execute(
        GetPositionMarketValueReturnValueReturnPercentUseCaseArguments(
          positionId: position.id,
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
      return GetInstrumentMarketValueReturnValueReturnPercentUseCaseResult(
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

class GetInstrumentMarketValueReturnValueReturnPercentUseCaseArguments {
  final String instrumentId;

  GetInstrumentMarketValueReturnValueReturnPercentUseCaseArguments({
    required this.instrumentId,
  });
}

class GetInstrumentMarketValueReturnValueReturnPercentUseCaseResult {
  final PhysicalCurrencyValue marketValue;
  final PhysicalCurrencyValue returnValue;
  final PhysicalCurrencyValue invested;
  final PercentValue returnPercent;

  GetInstrumentMarketValueReturnValueReturnPercentUseCaseResult({
    required this.marketValue,
    required this.returnValue,
    required this.invested,
    required this.returnPercent,
  });
}
