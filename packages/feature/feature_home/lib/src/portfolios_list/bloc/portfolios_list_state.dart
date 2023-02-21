import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolios_list_state.freezed.dart';

@freezed
class PortfoliosListState with _$PortfoliosListState {
  factory PortfoliosListState(List<PortfolioViewModel> portfolios) = _PortfoliosListState;

  factory PortfoliosListState.initial() => PortfoliosListState([]);
}

class PortfolioViewModel {
  final String id;
  final String name;

  PortfolioViewModel({
    required this.id,
    required this.name,
  });
}
