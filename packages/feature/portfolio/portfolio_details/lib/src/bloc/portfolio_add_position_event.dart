import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_machine/time_machine.dart';

part 'portfolio_add_position_event.freezed.dart';

@freezed
class PortfolioAddPositionEvent with _$PortfolioAddPositionEvent {
  factory PortfolioAddPositionEvent.init(String instrumentId) = PortfolioAddPositionEventInit;

  factory PortfolioAddPositionEvent.submit() = PortfolioAddPositionEventSubmit;

  factory PortfolioAddPositionEvent.countChanged(double count) =
      PortfolioAddPositionEventCountChanged;

  factory PortfolioAddPositionEvent.dateChanged(LocalDate date) =
      PortfolioAddPositionEventDateChanged;

  factory PortfolioAddPositionEvent.priceChanged(double price) =
      PortfolioAddPositionEventPriceChanged;
}
