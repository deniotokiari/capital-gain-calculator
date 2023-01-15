import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_up/src/bloc/sign_up_event.dart';
import 'package:sign_up/src/bloc/sign_up_state.dart';
import 'package:sign_up_usecase/sign_up.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignUpBloc(
    this._signUpUseCase,
  ) : super(SignUpState.empty()) {
    on<SignUpEventEventEmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<SignUpEventPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
    on<SignUpEventAlphavantageKeyChanged>((event, emit) {
      emit(state.copyWith(alphavantageKey: event.alphavantageKey));
    });
    on<SignUpEventSignUp>((event, emit) async {
      final result = await _signUpUseCase.execute(SignUpUseCaseArguments(
        email: state.email!,
        password: state.password!,
        alphavantageKey: state.alphavantageKey!,
      ));

      switch (result) {
        case SignUpUseCaseResult.success:
          // TODO: navigate to main screen

          break;
        case SignUpUseCaseResult.failed:
          emit(state.copyWith(failedReason: 'Unknown reason!'));

          break;
        case SignUpUseCaseResult.weakPassword:
          emit(state.copyWith(failedReason: 'Weak password!'));

          break;
        case SignUpUseCaseResult.emailAlreadyInUse:
          emit(state.copyWith(failedReason: 'Email already in use!'));

          break;
      }
    });
  }
}
