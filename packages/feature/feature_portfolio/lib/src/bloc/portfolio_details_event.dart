import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_details_event.freezed.dart';

@freezed
class PortfolioDetailsEvent with _$PortfolioDetailsEvent {
  factory PortfolioDetailsEvent.init(String id) = PortfolioDetailsEventInit;
}
