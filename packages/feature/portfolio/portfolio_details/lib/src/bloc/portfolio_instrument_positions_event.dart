import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_instrument_positions_event.freezed.dart';

@freezed
class PortfolioInstrumentPositionsEvent with _$PortfolioInstrumentPositionsEvent {
  factory PortfolioInstrumentPositionsEvent.init(String instrumentId) = PortfolioInstrumentPositionsEventInit;
}
