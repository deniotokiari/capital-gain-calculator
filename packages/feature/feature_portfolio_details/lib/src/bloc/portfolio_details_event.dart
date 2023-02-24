import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:data_symbol/data_symbol.dart';

part 'portfolio_details_event.freezed.dart';

@freezed
class PortfolioDetailsEvent with _$PortfolioDetailsEvent {
  factory PortfolioDetailsEvent.init(String id) = PortfolioDetailsEventInit;

  factory PortfolioDetailsEvent.addSymbol(Symbol symbol) = PortfolioDetailsEventAddSymbol;

  factory PortfolioDetailsEvent.updateInatruments() = PortfolioDetailsEventUpdateInatruments;
}
