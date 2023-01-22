import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in/src/bloc/sign_in_event.dart';
import 'package:sign_in/src/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState.idle()) {
    on<SignInEventEventEmailChanged>((event, emit) {});
    on<SignInEventPasswordChanged>((event, emit) {});
    on<SignInEventSignIn>((event, emit) {});
  }
}
