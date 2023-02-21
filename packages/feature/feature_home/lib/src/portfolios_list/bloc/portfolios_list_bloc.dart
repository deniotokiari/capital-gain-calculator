import 'dart:async';

import 'package:feature_home/src/portfolios_list/bloc/portfolios_list_event.dart';
import 'package:feature_home/src/portfolios_list/bloc/portfolios_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usecase_home/home_usecase.dart';

class PortfoliosListBloc extends Bloc<PortfoliosListEvent, PortfoliosListState> {
  final GetAllPortfoliosUseCase _getAllPortfoliosUseCase;
  final PortfoliosUpdatesUseCase _portfoliosUpdatesUseCase;

  StreamSubscription? _streamSubscription;

  PortfoliosListBloc(
    this._getAllPortfoliosUseCase,
    this._portfoliosUpdatesUseCase,
  ) : super(PortfoliosListState.initial()) {
    on<PortfoliosListEventInit>((event, emit) async {
      await _update(emit);

      await _streamSubscription?.cancel();
      _streamSubscription = _portfoliosUpdatesUseCase.execute(PortfoliosUpdatesUseCaseArguments()).listen((event) {
        add(PortfoliosListEvent.update());
      });
    });
    on<PortfoliosListEventUpdate>((event, emit) async {
      await _update(emit);
    });
  }

  Future<void> _update(dynamic emit) async {
    final model = await _getAllPortfoliosUseCase.execute(GetAllPortfoliosUseCaseArguments());

    emit(state.copyWith(portfolios: [...model.portfolios.map((e) => PortfolioViewModel(e))]));
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();

    return super.close();
  }
}
