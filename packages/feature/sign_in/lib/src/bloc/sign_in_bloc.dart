import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in/src/bloc/sign_in_event.dart';
import 'package:sign_in/src/bloc/sign_in_state.dart';
import 'package:sign_in_usecase/sign_in_use_case.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase _signInUseCase;

  String? _email;
  String? _password;

  SignInBloc(this._signInUseCase) : super(SignInState.idle(isSignInButtonEnabled: false)) {
    on<SignInEventEventEmailChanged>((event, emit) {
      _email = event.email;

      emit(SignInState.idle(isSignInButtonEnabled: _isSignInButtonEnabled));
    });
    on<SignInEventPasswordChanged>((event, emit) {
      _password = event.password;

      emit(SignInState.idle(isSignInButtonEnabled: _isSignInButtonEnabled));
    });
    on<SignInEventSignIn>((event, emit) async {
      emit(SignInState.loading());

      final result = await _signInUseCase.execute(SignInUseCaseArguments(email: _email!, password: _password!));

      switch (result) {
        case SignInUseCaseResult.success:
          emit(SignInState.signInSuccess('Successful!'));

          break;
        case SignInUseCaseResult.failed:
          emit(SignInState.signInFailed('Unknown reason!'));

          break;
        case SignInUseCaseResult.userNotFound:
          emit(SignInState.signInFailed('User not found!'));

          break;
        case SignInUseCaseResult.wrongPassword:
          emit(SignInState.signInFailed('Wrong password!'));

          break;
        case SignInUseCaseResult.invalidEmail:
          emit(SignInState.signInFailed('Invalid email!'));

          break;
        case SignInUseCaseResult.userDisabled:
          emit(SignInState.signInFailed('User disabled!'));

          break;
      }
    });
  }

  bool get _isSignInButtonEnabled => _email != null && _email!.isNotEmpty && _password != null && _password!.isNotEmpty;
}
