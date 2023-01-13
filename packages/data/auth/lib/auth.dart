library auth;

import 'package:auth/repository/auth_repository.dart';
import 'package:auth/source/firebase_auth_source.dart';
import 'package:utility/utility.dart';

export 'repository/auth_repository.dart';
export 'repository/credential.dart';

class AuthModule extends DependencyModule {
  @override
  void init() {
    registerLazySingleton(() => AuthRepository(FirebaseAuthSource()));
  }
}
