import 'package:common/common.dart';
import 'package:db/db.dart' as db;
import 'package:physical_currency/physical_currency.dart';
import 'package:portfolio_use_case/portfolio_use_case.dart';

class GetPositionMarketValueReturnValueReturnPercentUseCase
    implements
        UseCase<GetPositionMarketValueReturnValueReturnPercentUseCaseArguments,
            Future<GetPositionMarketValueReturnValueReturnPercentUseCaseResult?>> {
  final db.PositionRepository _positionRepository;
  final db.InstrumentRepository _instrumentRepository;
  final db.SymbolRepository _symbolRepository;
  final db.QuoteRepository _quoteRepository;
  final GetPhysicalCurrencyByIdUseCase _getPhysicalCurrencyByIdUseCase;
  final ConvertPhysicalCurrencyUseCaseUseCase _convertPhysicalCurrencyUseCaseUseCase;

  GetPositionMarketValueReturnValueReturnPercentUseCase(
    this._positionRepository,
    this._instrumentRepository,
    this._symbolRepository,
    this._quoteRepository,
    this._getPhysicalCurrencyByIdUseCase,
    this._convertPhysicalCurrencyUseCaseUseCase,
  );
  
  @override
  Future<GetPositionMarketValueReturnValueReturnPercentUseCaseResult?> execute(
      GetPositionMarketValueReturnValueReturnPercentUseCaseArguments args) async {
    final position = await _positionRepository.get(args.positionId);
    final instrument = await _instrumentRepository.get(position.instrumentId);
    final quote = await _quoteRepository
        .where((map) => map['symbolId'] == instrument.symbolId)
        .then((value) => value.isEmpty ? null : value.first);

    if (quote == null) {
      return null;
    } else {
      final symbol = await _symbolRepository.get(instrument.symbolId.require);
      final positionPhysicalCurrency =
          await _getPhysicalCurrencyByIdUseCase.execute(position.price.currencyId);
      final quotePhysicalCurrency =
          await _getPhysicalCurrencyByIdUseCase.execute(symbol.physicalCurrencyId);
      final marketValue = await _convertPhysicalCurrencyUseCaseUseCase
          .execute(
            ConvertPhysicalCurrencyUseCaseArguments(
              from: PhysicalCurrencyValue(
                value: position.count * quote.previousClose.value,
                currency: quotePhysicalCurrency,
              ),
              to: positionPhysicalCurrency,
            ),
          )
          .then((value) => value.value);
      final returnValue = PhysicalCurrencyValue(
        currency: positionPhysicalCurrency,
        value: marketValue.value - position.price.value,
      );
      final returnPercent = PercentValue(returnValue.value / position.price.value);

      return GetPositionMarketValueReturnValueReturnPercentUseCaseResult(
        marketValue: marketValue,
        returnValue: returnValue,
        invested: PhysicalCurrencyValue(
          value: position.price.value,
          currency: positionPhysicalCurrency,
        ),
        returnPercent: returnPercent,
      );
    }
  }
}

class GetPositionMarketValueReturnValueReturnPercentUseCaseArguments {
  final String positionId;

  GetPositionMarketValueReturnValueReturnPercentUseCaseArguments({
    required this.positionId,
  });
}

class GetPositionMarketValueReturnValueReturnPercentUseCaseResult {
  final PhysicalCurrencyValue marketValue;
  final PhysicalCurrencyValue returnValue;
  final PhysicalCurrencyValue invested;
  final PercentValue returnPercent;

  GetPositionMarketValueReturnValueReturnPercentUseCaseResult({
    required this.marketValue,
    required this.returnValue,
    required this.invested,
    required this.returnPercent,
  });
}
