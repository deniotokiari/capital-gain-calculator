import 'dart:async';

import 'package:all_portfolios/src/bloc/all_portfolios_event.dart';
import 'package:all_portfolios/src/bloc/all_portfolios_state.dart';
import 'package:all_portfolios/src/model/all_portfolios_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_data/portfolio_data.dart';
import 'package:portfolio_use_case/portfolio_use_case.dart';

class AllPortfoliosBloc extends Bloc<AllPortfoliosEvent, AllPortfoliosState> {
  final GetAllPortfoliosUseCase _getAllPortfoliosUseCase;
  final PortfoliosUpdatesUseCase _portfoliosUpdatesUseCase;

  StreamSubscription<Portfolio>? _streamSubscription;

  AllPortfoliosBloc(
    this._getAllPortfoliosUseCase,
    this._portfoliosUpdatesUseCase,
  ) : super(
          AllPortfoliosState.idle(AllPortfoliosViewModel([])),
        ) {
    on<AllPortfoliosEventInit>((event, emit) async {
      emit(
        AllPortfoliosState.idle(
          AllPortfoliosViewModel.fromPortfoliosList(
            await _getAllPortfoliosUseCase.execute(null),
          ),
        ),
      );
    });

    _streamSubscription = _portfoliosUpdatesUseCase.execute(null).listen((_) {
      add(AllPortfoliosEvent.init());
    });
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();

    return super.close();
  }
}
