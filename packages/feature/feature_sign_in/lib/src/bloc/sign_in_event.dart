import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_event.freezed.dart';

@freezed
class SignInEvent with _$SignInEvent {
  factory SignInEvent.emailChanged(final String email) = SignInEventEventEmailChanged;

  factory SignInEvent.passwordChanged(final String password) = SignInEventPasswordChanged;

  factory SignInEvent.signIn() = SignInEventSignIn;
}
