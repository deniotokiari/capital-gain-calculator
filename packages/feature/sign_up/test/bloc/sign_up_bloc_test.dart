import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sign_up/sign_up.dart';
import 'package:sign_up/src/bloc/sign_up_event.dart';
import 'package:sign_up/src/bloc/sign_up_state.dart';
import 'package:sign_up_usecase/sign_up_use_case.dart';

void main() {
  late SignUpUseCase signUpUseCase;
  late SignUpBloc sut;

  setUp(() {
    signUpUseCase = _SignUpUseCaseMock();
    sut = SignUpBloc(signUpUseCase);
  });

  blocTest(
    'sign up button should be enabled if all fields filled',
    build: () => sut,
    act: (bloc) => bloc
      ..add(SignUpEvent.emailChanged('test@test.com'))
      ..add(SignUpEvent.passwordChanged('password'))
      ..add(SignUpEvent.alphavantageKeyChanged('alphavantageKey')),
    expect: () => [
      equals(SignUpState(email: 'test@test.com', password: null, alphavantageKey: null)),
      equals(SignUpState(email: 'test@test.com', password: 'password', alphavantageKey: null)),
      equals(SignUpState(email: 'test@test.com', password: 'password', alphavantageKey: 'alphavantageKey')),
    ],
    verify: (bloc) {
      expect(bloc.state.isSignUpButtonEnabled, true);
    },
  );

  blocTest(
    'sign up button should be disabled if at least one field is empty',
    build: () => sut,
    act: (bloc) => bloc..add(SignUpEvent.emailChanged('test@test.com')),
    expect: () => [
      equals(SignUpState(
        email: 'test@test.com',
        password: null,
        alphavantageKey: null,
      )),
    ],
    verify: (bloc) {
      expect(bloc.state.isSignUpButtonEnabled, false);
    },
  );

  blocTest(
    'failedReason should be not null in case of fail',
    build: () => sut,
    setUp: () {
      registerFallbackValue(SignUpUseCaseArguments(email: '', password: '', alphavantageKey: ''));
    },
    act: (bloc) {
      var count = 0;

      when(() => signUpUseCase.execute(any())).thenAnswer((_) async {
        count++;

        switch (count) {
          case 1:
            return SignUpUseCaseResult.emailAlreadyInUse;
          case 2:
            return SignUpUseCaseResult.weakPassword;
          default:
            return SignUpUseCaseResult.failed;
        }
      });

      bloc
        ..add(SignUpEvent.emailChanged('test@test.com'))
        ..add(SignUpEvent.passwordChanged('password'))
        ..add(SignUpEvent.alphavantageKeyChanged('alphavantageKey'));

      bloc.add(SignUpEvent.signUp());
      bloc.add(SignUpEvent.signUp());
      bloc.add(SignUpEvent.signUp());
    },
    skip: 3,
    expect: () => [
      equals(SignUpState.loading()),
      equals(SignUpState.signUpFailed(
        'Email already in use!',
      )),
      equals(SignUpState.loading()),
      equals(SignUpState.signUpFailed(
        'Weak password!',
      )),
      equals(SignUpState.loading()),
      equals(SignUpState.signUpFailed(
        'Unknown reason!',
      )),
    ],
  );

  blocTest(
    'state should be success if sign up successful',
    build: () => sut,
    setUp: () {
      registerFallbackValue(SignUpUseCaseArguments(email: '', password: '', alphavantageKey: ''));
      when(() => signUpUseCase.execute(any())).thenAnswer((_) => Future.value(SignUpUseCaseResult.success));
    },
    act: (bloc) {
      bloc
        ..add(SignUpEvent.emailChanged('test@test.com'))
        ..add(SignUpEvent.passwordChanged('password'))
        ..add(SignUpEvent.alphavantageKeyChanged('alphavantageKey'));

      bloc.add(SignUpEvent.signUp());
    },
    skip: 3,
    expect: () => [
      equals(SignUpState.loading()),
      equals(SignUpState.signUpSuccess('Successful')),
    ],
  );
}

class _SignUpUseCaseMock extends Mock implements SignUpUseCase {}
