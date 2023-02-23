import 'package:data_symbol/data_symbol.dart';
import 'package:feature_symbol_search/src/bloc/symbol_search_event.dart';
import 'package:feature_symbol_search/src/bloc/symbol_search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SymbolSearchBloc extends Bloc<SymbolSearchEvent, SymbolSearchState> {
  final SymbolRepository _symbolRepository;

  SymbolSearchBloc(
    this._symbolRepository,
  ) : super(SymbolSearchState.result([])) {
    on<SymbolSearchEventSearch>((event, emit) async {
      emit(SymbolSearchState.loading());
      emit(SymbolSearchState.result(await _symbolRepository.search(event.query)));
    });
  }
}
