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

class InstrumentStatePositions {}
