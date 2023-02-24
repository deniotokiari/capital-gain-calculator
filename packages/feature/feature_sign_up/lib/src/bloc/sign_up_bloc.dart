import 'package:data_currency/currency.dart';
import 'package:feature_sign_up/src/bloc/sign_up_event.dart';
import 'package:feature_sign_up/src/bloc/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usecase_sign_up/sign_up_use_case.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase _signUpUseCase;
  final CurrencyListRepository _currencyListRepository;

  String? _email;
  String? _password;
  String? _alphavantageKey;
  String? _selectedCurrency;
  final List<Currency> _listOfCurrency = [];

  SignUpBloc(
    this._signUpUseCase,
    this._currencyListRepository,
  ) : super(SignUpState.empty()) {
    on<SignUpEventEventInit>((event, emit) async {
      _listOfCurrency.clear();

      final listOfCurrency = await _currencyListRepository.getCurrencyList();

      _listOfCurrency.addAll(listOfCurrency);
      _selectedCurrency = _listOfCurrency.firstWhere((e) => e.isUsd).formatted;

      emit(SignUpState(
        email: _email,
        password: _password,
        alphavantageKey: _alphavantageKey,
        listOfCurrency: _listOfCurrency.formatted,
        selectedCurrency: _selectedCurrency,
      ));
    });
    on<SignUpEventEventEmailChanged>((event, emit) {
      _email = event.email;

      emit(SignUpState(
        email: _email,
        password: _password,
        alphavantageKey: _alphavantageKey,
        selectedCurrency: _selectedCurrency,
        listOfCurrency: _listOfCurrency.formatted,
      ));
    });
    on<SignUpEventPasswordChanged>((event, emit) {
      _password = event.password;

      emit(SignUpState(
        email: _email,
        password: _password,
        alphavantageKey: _alphavantageKey,
        selectedCurrency: _selectedCurrency,
        listOfCurrency: _listOfCurrency.formatted,
      ));
    });
    on<SignUpEventAlphavantageKeyChanged>((event, emit) {
      _alphavantageKey = event.alphavantageKey;

      emit(SignUpState(
        email: _email,
        password: _password,
        alphavantageKey: _alphavantageKey,
        selectedCurrency: _selectedCurrency,
        listOfCurrency: _listOfCurrency.formatted,
      ));
    });
    on<SignUpEventEventCurrencyChanged>((event, emit) {
      _selectedCurrency = event.currency;

      emit(SignUpState(
        email: _email,
        password: _password,
        alphavantageKey: _alphavantageKey,
        selectedCurrency: _selectedCurrency,
        listOfCurrency: _listOfCurrency.formatted,
      ));
    });
    on<SignUpEventSignUp>((event, emit) async {
      emit(SignUpState.loading());

      final result = await _signUpUseCase.execute(SignUpUseCaseArguments(
        email: _email!,
        password: _password!,
        alphavantageKey: _alphavantageKey!,
        currency: _listOfCurrency.firstWhere((element) => _selectedCurrency!.contains(element.code)),
      ));

      switch (result) {
        case SignUpUseCaseResult.success:
          emit(SignUpState.signUpSuccess('Successful'));

          break;
        case SignUpUseCaseResult.failed:
          emit(SignUpState.signUpFailed('Unknown reason!'));

          break;
        case SignUpUseCaseResult.weakPassword:
          emit(SignUpState.signUpFailed('Weak password!'));

          break;
        case SignUpUseCaseResult.emailAlreadyInUse:
          emit(SignUpState.signUpFailed('Email already in use!'));

          break;
        case SignUpUseCaseResult.invalidEmail:
          emit(SignUpState.signUpFailed('Invalid email!'));

          break;
        case SignUpUseCaseResult.operationNotAllowed:
          emit(SignUpState.signUpFailed('Operation not allowed!'));

          break;
      }
    });
  }
}
