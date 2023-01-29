import 'package:currency/currency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash/src/bloc/splash_event.dart';
import 'package:splash/src/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final CurrencyListRepository _currencyListRepository;

  SplashBloc(this._currencyListRepository) : super(SplashState.loading()) {
    on<SplashEvent>((event, emit) async {
      emit(SplashState.loading());

      await _currencyListRepository.loadCurrencyList();

      emit(SplashState.done());
    });
  }
}
