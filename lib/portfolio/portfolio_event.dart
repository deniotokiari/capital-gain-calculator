import 'package:capital_gain_calculator/search/search_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_event.freezed.dart';

@freezed
class PortfolioEvent with _$PortfolioEvent {
  factory PortfolioEvent.addSymbol(SearchResultItem item) = PortfolioEventAddSymbol;
}
