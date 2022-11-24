import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:physical_currency/physical_currency.dart';
import 'package:portfolio_use_case/portfolio_use_case.dart';

part 'portfolio_instrument_positions_state.freezed.dart';

final _dateFormatter = DateFormat('dd/MM/yyyy');

@freezed
class PortfolioInstrumentPositionsState with _$PortfolioInstrumentPositionsState {
  factory PortfolioInstrumentPositionsState.idle(PortfolioInstrumentPositionsViewModel model) =
      _PortfolioInstrumentPositionsStateIdle;
}

class PortfolioInstrumentPositionsViewModel {
  final List<PortfolioInstrumentPositionViewModel> positions;

  PortfolioInstrumentPositionsViewModel(this.positions);

  factory PortfolioInstrumentPositionsViewModel.initial() =>
      PortfolioInstrumentPositionsViewModel([]);

  factory PortfolioInstrumentPositionsViewModel.fromPositions(
          GetPositionsByInstrumentIdUseCaseResult? result) =>
      PortfolioInstrumentPositionsViewModel([
        ...result?.items.map(
              (e) => PortfolioInstrumentPositionViewModel(
                date: _dateFormatter.format(e.date),
                marketValue: e.marketValue,
                returnValue: e.returnValue,
                count: e.count.toString(),
                returnPercent: e.returnPercent,
              ),
            ) ??
            []
      ]);
}

class PortfolioInstrumentPositionViewModel {
  final PhysicalCurrencyValue marketValue;
  final PhysicalCurrencyValue returnValue;
  final PercentValue returnPercent;
  final String count;
  final String date;

  PortfolioInstrumentPositionViewModel({
    required this.marketValue,
    required this.returnValue,
    required this.returnPercent,
    required this.count,
    required this.date,
  });
}
