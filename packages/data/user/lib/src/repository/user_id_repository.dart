import 'package:auth/auth.dart';

class UserIdRepository {
  final AuthRepository _authRepository;

  UserIdRepository(this._authRepository);

  String? getUserId() => _authRepository.userEmail;
}
