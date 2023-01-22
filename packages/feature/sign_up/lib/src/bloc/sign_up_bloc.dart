import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_up/src/bloc/sign_up_event.dart';
import 'package:sign_up/src/bloc/sign_up_state.dart';
import 'package:sign_up_usecase/sign_up_use_case.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase _signUpUseCase;

  String? _email;
  String? _password;
  String? _alphavantageKey;
  String? _failedReason;

  SignUpBloc(
    this._signUpUseCase,
  ) : super(SignUpState.empty()) {
    on<SignUpEventEventEmailChanged>((event, emit) {
      _email = event.email;

      emit(SignUpState(email: _email, password: _password, alphavantageKey: _alphavantageKey, failedReason: _failedReason));
    });
    on<SignUpEventPasswordChanged>((event, emit) {
      _password = event.password;

      emit(SignUpState(email: _email, password: _password, alphavantageKey: _alphavantageKey, failedReason: _failedReason));
    });
    on<SignUpEventAlphavantageKeyChanged>((event, emit) {
      _alphavantageKey = event.alphavantageKey;

      emit(SignUpState(email: _email, password: _password, alphavantageKey: _alphavantageKey, failedReason: _failedReason));
    });
    on<SignUpEventSignUp>((event, emit) async {
      emit(SignUpState.loading());

      final result = await _signUpUseCase.execute(SignUpUseCaseArguments(
        email: _email!,
        password: _password!,
        alphavantageKey: _alphavantageKey!,
      ));

      switch (result) {
        case SignUpUseCaseResult.success:
          emit(SignUpState.signUpSuccess('Successful'));

          break;
        case SignUpUseCaseResult.failed:
          _failedReason = 'Unknown reason!';

          emit(SignUpState(email: _email, password: _password, alphavantageKey: _alphavantageKey, failedReason: _failedReason));

          break;
        case SignUpUseCaseResult.weakPassword:
          _failedReason = 'Weak password!';

          emit(SignUpState(email: _email, password: _password, alphavantageKey: _alphavantageKey, failedReason: _failedReason));

          break;
        case SignUpUseCaseResult.emailAlreadyInUse:
          _failedReason = 'Email already in use!';

          emit(SignUpState(email: _email, password: _password, alphavantageKey: _alphavantageKey, failedReason: _failedReason));

          break;
      }
    });
  }
}
