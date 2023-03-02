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
  final MarketValue? marketValue;

  InstrumentStateTitle({
    required this.title,
    required this.marketValue,
  });
}

class InstrumentStatePositions {
  final List<InstrumentStatePositionsItem> items;

  InstrumentStatePositions(this.items);
}

class InstrumentStatePositionsItem {
  final String id;
  final String date;
  final MarketValue? marketValue;

  InstrumentStatePositionsItem({
    required this.id,
    required this.date,
    required this.marketValue,
  });
}
