import 'package:capital_gain_calculator/main/main_event.dart';
import 'package:capital_gain_calculator/main/main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState.idle()) {
    on<MainEventInit>((_, emit) {
      emit(MainState.idle());
    });
  }
}
