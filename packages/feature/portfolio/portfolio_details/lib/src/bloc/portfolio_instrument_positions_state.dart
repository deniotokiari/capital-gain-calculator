import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:portfolio_use_case/portfolio_use_case.dart';

part 'portfolio_instrument_positions_state.freezed.dart';

final _dateFormatter = DateFormat('d MMMM yyyy');

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

  factory PortfolioInstrumentPositionsViewModel.fromInstrumentPositions(
          List<InstrumentPosition> items) =>
      PortfolioInstrumentPositionsViewModel([
        ...items.map((e) => PortfolioInstrumentPositionViewModel(
              count: e.position.count.toString(),
              price: e.position.price.toString(),
              date: _dateFormatter.format(e.position.date),
            ))
      ]);
}

class PortfolioInstrumentPositionViewModel {
  final String count;
  final String price;
  final String date;

  PortfolioInstrumentPositionViewModel({
    required this.count,
    required this.price,
    required this.date,
  });
}
