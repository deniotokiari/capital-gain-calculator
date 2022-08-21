import 'package:capital_gain_calculator/search/search_event.dart';
import 'package:capital_gain_calculator/search/search_state.dart';
import 'package:common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_service/stock_service.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final StockServiceApi _stockServiceApi;

  SearchBloc(
    this._stockServiceApi,
  ) : super(SearchState.initial()) {
    on<SearchEventClear>((event, emit) => emit(SearchState.initial()));
    on<SearchEventSearch>((event, emit) async {
      emit(SearchState.loading());

      if (event.query.isEmpty) {
        emit(SearchState.initial());
      } else {
        final result = await _stockServiceApi
            .symbolSearch(
              event.query,
            )
            .runCatching();

        result.when(
          success: (data) => emit(
            SearchState.result(SearchResult(data.bestMatches)),
          ),
          failed: (error) => emit(SearchState.error()),
        );
      }
    });
  }
}
