import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  factory SignUpState({
    required final String? email,
    required final String? password,
    required final String? alphavantageKey,
    required final String? selectedCurrency,
    required final List<String>? listOfCurrency,
  }) = _SignUpState;

  factory SignUpState.loading() = _SignUpStateLoading;

  factory SignUpState.signUpSuccess(String message) = _SignUpStateSignUpSuccess;

  factory SignUpState.signUpFailed(String message) = _SignUpStateSignUpFailed;

  factory SignUpState.empty() => SignUpState(
        email: null,
        password: null,
        alphavantageKey: null,
        selectedCurrency: null,
        listOfCurrency: null,
      );
}

extension SignUpStateExt on SignUpState {
  bool get isSignUpButtonEnabled => map(
        (value) {
          final email = value.email;
          final password = value.password;
          final alphavantageKey = value.alphavantageKey;
          final selectedCurrency = value.selectedCurrency;

          return email != null &&
              email.isNotEmpty &&
              password != null &&
              password.isNotEmpty &&
              alphavantageKey != null &&
              alphavantageKey.isNotEmpty &&
              selectedCurrency != null &&
              selectedCurrency.isNotEmpty;
        },
        loading: (_) => false,
        signUpSuccess: (_) => false,
        signUpFailed: (_) => true,
      );
}
