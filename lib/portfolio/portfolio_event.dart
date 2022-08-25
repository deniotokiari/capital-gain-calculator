import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_event.freezed.dart';

@freezed
class PortfolioEvent with _$PortfolioEvent {
  factory PortfolioEvent.init(int portfolioId) = PortfolioEventInit;
}
