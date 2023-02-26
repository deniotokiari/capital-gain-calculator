import 'package:data_market_value/data_market_value.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolios_list_state.freezed.dart';

@freezed
class PortfoliosListState with _$PortfoliosListState {
  factory PortfoliosListState(
    MarketValue? marketValue,
    List<PortfolioViewModel> portfolios,
  ) = _PortfoliosListState;

  factory PortfoliosListState.initial() => PortfoliosListState(null, []);
}

class PortfolioViewModel {
  final String id;
  final String name;
  final MarketValue? marketValue;

  PortfolioViewModel({
    required this.id,
    required this.name,
    required this.marketValue,
  });
}
