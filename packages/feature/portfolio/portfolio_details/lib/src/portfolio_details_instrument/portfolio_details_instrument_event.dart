import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_details_instrument_event.freezed.dart';

@freezed
class PortfolioDetailsInstrumentEvent with _$PortfolioDetailsInstrumentEvent {
  factory PortfolioDetailsInstrumentEvent.init({required String instrumentId}) =
      PortfolioDetailsInstrumentEventInit;

      factory PortfolioDetailsInstrumentEvent.refresh() =
      PortfolioDetailsInstrumentEventRefresh;
}
