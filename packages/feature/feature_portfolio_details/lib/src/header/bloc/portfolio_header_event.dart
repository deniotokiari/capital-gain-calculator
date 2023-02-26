import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_header_event.freezed.dart';

@freezed
class PortfolioHeaderEvent with _$PortfolioHeaderEvent {
  factory PortfolioHeaderEvent.init(String porftolioId) = PortfolioHeaderEventInit;

  factory PortfolioHeaderEvent.update() = PortfolioHeaderEventUpdate;
}
