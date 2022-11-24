import 'package:common/common.dart';
import 'package:db/db.dart' as db;
import 'package:physical_currency/physical_currency.dart';
import 'package:portfolio_use_case/src/position/get_position_market_value_return_value_return_percent_use_case.dart.dart';

class GetPositionsByInstrumentIdUseCase
    implements
        UseCase<GetPositionsByInstrumentIdUseCaseArguments,
            Future<GetPositionsByInstrumentIdUseCaseResult?>> {
  final db.PositionRepository _positionRepository;
  final GetPositionMarketValueReturnValueReturnPercentUseCase
      _getPositionMarketValueReturnValueReturnPercentUseCase;

  GetPositionsByInstrumentIdUseCase(
    this._positionRepository,
    this._getPositionMarketValueReturnValueReturnPercentUseCase,
  );

  @override
  Future<GetPositionsByInstrumentIdUseCaseResult?> execute(
      GetPositionsByInstrumentIdUseCaseArguments args) async {
    final positions = await _positionRepository.where((map) => map['instrumentId'] == args.instrumentId);
    final result = <GetPositionsByInstrumentIdUseCaseResultItem>[];

    for (final position in positions) {
      final values = await _getPositionMarketValueReturnValueReturnPercentUseCase.execute(
        GetPositionMarketValueReturnValueReturnPercentUseCaseArguments(
          positionId: position.id,
        ),
      );

      if (values != null) {
        result.add(GetPositionsByInstrumentIdUseCaseResultItem(
          marketValue: values.marketValue,
          returnValue: values.returnValue,
          invested: values.invested,
          returnPercent: values.returnPercent,
          count: position.count,
          date: position.date,
        ));
      }
    }

    return result.isEmpty ? null : GetPositionsByInstrumentIdUseCaseResult(items: result);
  }
}

class GetPositionsByInstrumentIdUseCaseArguments {
  final String instrumentId;

  GetPositionsByInstrumentIdUseCaseArguments({
    required this.instrumentId,
  });
}

class GetPositionsByInstrumentIdUseCaseResult {
  final List<GetPositionsByInstrumentIdUseCaseResultItem> items;

  GetPositionsByInstrumentIdUseCaseResult({
    required this.items,
  });
}

class GetPositionsByInstrumentIdUseCaseResultItem {
  final PhysicalCurrencyValue marketValue;
  final PhysicalCurrencyValue returnValue;
  final PhysicalCurrencyValue invested;
  final PercentValue returnPercent;
  final double count;
  final DateTime date;

  GetPositionsByInstrumentIdUseCaseResultItem({
    required this.marketValue,
    required this.returnValue,
    required this.invested,
    required this.returnPercent,
    required this.count,
    required this.date,
  });
}
