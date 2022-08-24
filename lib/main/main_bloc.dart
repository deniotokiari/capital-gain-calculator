import 'package:capital_gain_calculator/main/main_event.dart';
import 'package:capital_gain_calculator/main/main_state.dart';
import 'package:capital_gain_calculator/portfolio/portfolio_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final PortfolioRepository _portfolioRepository;

  MainBloc(
    this._portfolioRepository,
  ) : super(MainState.idle([])) {
    on<MainEventInit>((event, emit) async {
      print('LOG: emit');
      emit(MainState.idle(await _portfolioRepository.getAll()));
    });
  }
}
