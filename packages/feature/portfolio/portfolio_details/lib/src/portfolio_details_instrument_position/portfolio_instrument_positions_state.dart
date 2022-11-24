import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:portfolio_data/portfolio_data.dart';

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

  factory PortfolioInstrumentPositionsViewModel.fromPositions(List<Position> items) =>
      PortfolioInstrumentPositionsViewModel([
        ...items.map((e) => PortfolioInstrumentPositionViewModel(
              date: _dateFormatter.format(e.date),
              count: e.count.toString(),
              currency: e.price.currency.sign,
              marketValue: e.price.value + e.returnValue,
              returnValue: e.returnValue,
              returnPercent: e.returnPercent,
            ))
      ]);
}

class PortfolioInstrumentPositionViewModel {
  final String date;
  final String count;
  final String currency;
  final double marketValue;
  final double returnValue;
  final double returnPercent;

  PortfolioInstrumentPositionViewModel({
    required this.date,
    required this.count,
    required this.currency,
    required this.marketValue,
    required this.returnValue,
    required this.returnPercent,
  });
}
