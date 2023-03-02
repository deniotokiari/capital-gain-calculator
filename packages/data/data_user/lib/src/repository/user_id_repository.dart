import 'package:data_auth/repository/auth_repository.dart';

class UserIdRepository {
  final AuthRepository _authRepository;

  UserIdRepository(this._authRepository);

  String? getUserId() => _authRepository.userEmail;
}
