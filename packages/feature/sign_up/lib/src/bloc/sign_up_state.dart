import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  factory SignUpState({
    required final String? email,
    required final String? password,
    required final String? alphavantageKey,
    required final String? failedReason,
  }) = _SignUpState;

  factory SignUpState.empty() => SignUpState(
        email: null,
        password: null,
        alphavantageKey: null,
        failedReason: null,
      );
}

extension on SignUpState {
  bool get isSignUpButtonEnabled =>
      email != null &&
      password != null &&
      email?.isNotEmpty == true &&
      password?.isNotEmpty == true;
}
