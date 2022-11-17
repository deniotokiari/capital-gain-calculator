import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_details_header_event.freezed.dart';

@freezed
class PortfolioDetailsHeaderEvent with _$PortfolioDetailsHeaderEvent {
  factory PortfolioDetailsHeaderEvent.init(String portfolioId) = PortfolioDetailsHeaderEventInit;

  factory PortfolioDetailsHeaderEvent.refresh() = PortfolioDetailsHeaderEventRefresh;
}
