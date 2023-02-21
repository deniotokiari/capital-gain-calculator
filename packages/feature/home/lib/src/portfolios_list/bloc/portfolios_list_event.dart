import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolios_list_event.freezed.dart';

@freezed
class PortfoliosListEvent with _$PortfoliosListEvent {
  factory PortfoliosListEvent.init() = PortfoliosListEventInit;

  factory PortfoliosListEvent.update() = PortfoliosListEventUpdate;
}
