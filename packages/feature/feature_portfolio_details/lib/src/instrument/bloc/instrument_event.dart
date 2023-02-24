import 'package:freezed_annotation/freezed_annotation.dart';

part 'instrument_event.freezed.dart';

@freezed
class InstrumentEvent with _$InstrumentEvent {
  factory InstrumentEvent.init(String instrumentId) = InstrumentEventInit;

  factory InstrumentEvent.update() = InstrumentEventUpdate;
}
