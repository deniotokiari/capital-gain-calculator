import 'package:common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_service/stock_service.dart';
import 'package:symbol_search/src/bloc/symbol_search_event.dart';
import 'package:symbol_search/src/bloc/symbol_search_state.dart';
import 'package:symbol_search/src/model/symbol_search_view_model.dart';

class SymbolSearchBloc extends Bloc<SymbolSearchEvent, SymbolSearchState> {
  final StockServiceApi _stockServiceApi;

  SymbolSearchBloc(this._stockServiceApi) : super(SymbolSearchState.initial()) {
    on<SymbolSearchEventClear>((event, emit) => emit(SymbolSearchState.initial()));
    on<SymbolSearchEventSearch>((event, emit) async {
      emit(SymbolSearchState.loading());

      if (event.query.isEmpty) {
        emit(SymbolSearchState.initial());
      } else {
        final result = await _stockServiceApi
            .symbolSearch(
              event.query,
            )
            .runCatching();

        result.when(
          success: (data) => emit(SymbolSearchState.result(SymbolSearchViewModel(
            [
              ...data.bestMatches.map(
                SymbolSearchViewModelItem.fromSymbolSearchMatch,
              ),
            ],
          ))),
          failed: (error) => emit(SymbolSearchState.error()),
        );
      }
    });
  }
}
