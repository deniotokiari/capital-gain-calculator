import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_up/src/bloc/sign_up_event.dart';
import 'package:sign_up/src/bloc/sign_up_state.dart';
import 'package:sign_up_usecase/sign_up.dart';

class CreateUserBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase _signUpUseCase;

  CreateUserBloc(
    this._signUpUseCase,
  ) : super(SignUpState.empty()) {
    on<SignUpEventEventEmailChanged>((event, emit) {});
    on<SignUpEventPasswordChanged>((event, emit) {});
    on<SignUpEventAlphavantageKeyChanged>((event, emit) {});
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
