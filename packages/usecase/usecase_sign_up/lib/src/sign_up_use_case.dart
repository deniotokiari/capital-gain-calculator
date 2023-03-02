import 'package:data_auth/repository/auth_repository.dart';
import 'package:data_auth/repository/credential.dart';
import 'package:data_currency/currency.dart';
import 'package:data_user/user.dart';
import 'package:utility/utility.dart';

class SignUpUseCase extends UseCase<SignUpUseCaseArguments, Future<SignUpUseCaseResult>> {
  final AuthRepository _authRepository;
  final UserSettingsRepository _userSettingsRepository;

  SignUpUseCase(
    this._authRepository,
    this._userSettingsRepository,
  );

  @override
  Future<SignUpUseCaseResult> execute(SignUpUseCaseArguments arg) async {
    final signUpResult = await _authRepository.createUser(Credential(
      email: arg.email,
      password: arg.password,
    ));

    switch (signUpResult) {
      case CreateUserResult.success:
        await _userSettingsRepository.setAlphavantageKey(arg.alphavantageKey);
        await _userSettingsRepository.setUserCurrency(arg.currency);

        return SignUpUseCaseResult.success;
      case CreateUserResult.failed:
        return SignUpUseCaseResult.failed;
      case CreateUserResult.weakPassword:
        return SignUpUseCaseResult.weakPassword;
      case CreateUserResult.emailAlreadyInUse:
        return SignUpUseCaseResult.emailAlreadyInUse;
      case CreateUserResult.invalidEmail:
        return SignUpUseCaseResult.invalidEmail;
      case CreateUserResult.operationNotAllowed:
        return SignUpUseCaseResult.operationNotAllowed;
    }
  }
}

class SignUpUseCaseArguments {
  final String email;
  final String password;
  final String alphavantageKey;
  final Currency currency;

  SignUpUseCaseArguments({
    required this.email,
    required this.password,
    required this.alphavantageKey,
    required this.currency,
  });
}

enum SignUpUseCaseResult {
  success,
  failed,
  weakPassword,
  emailAlreadyInUse,
  invalidEmail,
  operationNotAllowed,
}
