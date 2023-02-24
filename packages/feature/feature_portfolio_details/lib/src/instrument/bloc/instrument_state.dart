import 'package:data_market_value/data_market_value.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'instrument_state.freezed.dart';

@freezed
class InstrumentState with _$InstrumentState {
  factory InstrumentState.loading() = InstrumentStateLoading;

  factory InstrumentState.idle(InstrumentStateTitle title, InstrumentStatePositions positions) = InstrumentStateInstrumentIdle;
}

class InstrumentStateTitle {
  final String title;

  InstrumentStateTitle({
    required this.title,
  });
}

class InstrumentStatePositions {
  final List<InstrumentStatePositionsItem> items;

  InstrumentStatePositions(this.items);
}

class InstrumentStatePositionsItem {
  final String date;
  final MarketValue? marketValue;

  InstrumentStatePositionsItem(this.date, this.marketValue);
}
