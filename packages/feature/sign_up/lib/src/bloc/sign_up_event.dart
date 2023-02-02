import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_event.freezed.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
factory SignUpEvent.init() = SignUpEventEventInit;

  factory SignUpEvent.emailChanged(final String email) = SignUpEventEventEmailChanged;

  factory SignUpEvent.passwordChanged(final String password) = SignUpEventPasswordChanged;

  factory SignUpEvent.alphavantageKeyChanged(final String alphavantageKey) =
      SignUpEventAlphavantageKeyChanged;

      factory SignUpEvent.currencyChanged(final String currency) = SignUpEventEventCurrencyChanged;

  factory SignUpEvent.signUp() = SignUpEventSignUp;
}
