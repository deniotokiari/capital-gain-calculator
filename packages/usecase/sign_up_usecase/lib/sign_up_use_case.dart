import 'package:alphavantage/alphavantage.dart';
import 'package:auth/auth.dart';
import 'package:utility/utility.dart';

class SignUpUseCase extends UseCase<SignUpUseCaseArguments, Future<SignUpUseCaseResult>> {
  final AuthRepository _authRepository;
  final AlphavantageKeyRepository _alphavantageKeyRepository;

  SignUpUseCase(
    this._authRepository,
    this._alphavantageKeyRepository,
  );

  @override
  Future<SignUpUseCaseResult> execute(SignUpUseCaseArguments arg) async {
    final signUpResult = await _authRepository.createUser(Credential(
      email: arg.email,
      password: arg.email,
    ));

    switch (signUpResult) {
      case CreateUserResult.success:
        await _alphavantageKeyRepository.saveKey(
          userId: arg.email,
          key: arg.alphavantageKey,
        );

        return SignUpUseCaseResult.success;
      case CreateUserResult.failed:
        return SignUpUseCaseResult.failed;
      case CreateUserResult.weakPassword:
        return SignUpUseCaseResult.weakPassword;
      case CreateUserResult.emailAlreadyInUse:
        return SignUpUseCaseResult.emailAlreadyInUse;
    }
  }
}

class SignUpUseCaseArguments {
  final String email;
  final String password;
  final String alphavantageKey;

  SignUpUseCaseArguments({
    required this.email,
    required this.password,
    required this.alphavantageKey,
  });
}

enum SignUpUseCaseResult {
  success,
  failed,
  weakPassword,
  emailAlreadyInUse;
}
