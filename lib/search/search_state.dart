import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stock_service/stock_service.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  factory SearchState.initial() = _SearchStateInitial;

  factory SearchState.loading() = _SearchStateLoading;

  factory SearchState.result(SearchResult result) = _SearchStateResult;

  factory SearchState.error() = _SearchStateError;
}

class SearchResultItem {
  final String symbol;
  final String name;
  final String currency;
  final String region;
  final String type;
  final SymbolSearchMatch backendModel;

  SearchResultItem({
    required this.symbol,
    required this.name,
    required this.currency,
    required this.region,
    required this.type,
    required this.backendModel,
  });
}

class SearchResult {
  final List<SearchResultItem> items;

  SearchResult(List<SymbolSearchMatch> bestMatches)
      : items = bestMatches
            .map((e) => SearchResultItem(
                  symbol: e.symbol,
                  name: e.name,
                  currency: e.currency,
                  region: e.region,
                  type: e.type,
                  backendModel: e,
                ))
            .toList(growable: false);
}
