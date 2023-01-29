import 'package:auth/auth.dart';
import 'package:utility/utility.dart';

class SignInUseCase extends UseCase<SignInUseCaseArguments, Future<SignInUseCaseResult>> {
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  @override
  Future<SignInUseCaseResult> execute(SignInUseCaseArguments arg) async {
    final result = await _authRepository.signIn(Credential(email: arg.email, password: arg.password));

    switch (result) {
      case SignInResult.success:
        return SignInUseCaseResult.success;
      case SignInResult.failed:
        return SignInUseCaseResult.failed;
      case SignInResult.userNotFound:
        return SignInUseCaseResult.userNotFound;
      case SignInResult.wrongPassword:
        return SignInUseCaseResult.wrongPassword;
      case SignInResult.invalidEmail:
        return SignInUseCaseResult.invalidEmail;
      case SignInResult.userDisabled:
        return SignInUseCaseResult.userDisabled;
    }
  }
}

class SignInUseCaseArguments {
  final String email;
  final String password;

  SignInUseCaseArguments({
    required this.email,
    required this.password,
  });
}

enum SignInUseCaseResult {
  success,
  failed,
  userNotFound,
  wrongPassword,
  invalidEmail,
  userDisabled;
}
