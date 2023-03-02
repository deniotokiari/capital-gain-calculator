import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  factory SignInState.signInSuccess(String message) = SignInStateSignInSuccess;

  factory SignInState.signInFailed(String message) = _SignInStateSignInFailed;

  factory SignInState.loading() = _SignInStateLoading;

  factory SignInState.idle({required bool isSignInButtonEnabled}) = _SignInStateIdle;
}

extension SignInStateExt on SignInState {
  bool get isSignInButtonEnabled => map(
        signInSuccess: (_) => false,
        signInFailed: (_) => true,
        loading: (_) => false,
        idle: (idle) => idle.isSignInButtonEnabled,
      );
}
