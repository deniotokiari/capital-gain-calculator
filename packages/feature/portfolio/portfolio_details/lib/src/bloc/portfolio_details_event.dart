import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:symbol_api/symbol_api.dart';

part 'portfolio_details_event.freezed.dart';

@freezed
class PortfolioDetailsEvent with _$PortfolioDetailsEvent {
  factory PortfolioDetailsEvent.init(String portfolioId) = PortfolioDetailsEventInit;

  factory PortfolioDetailsEvent.addSymbol(SymbolSearchWidgetNavigationResult symbol) =
      PortfolioDetailsEventAddSymbol;
}
