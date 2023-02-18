library auth;

import 'package:auth/repository/auth_repository.dart';
import 'package:auth/source/firebase_auth_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:utility/utility.dart';

export 'repository/auth_repository.dart';
export 'repository/credential.dart';

class AuthModule extends DependencyModule {
  @override
  Future<void> init() async {
    if (kDebugMode) {
      await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    }

    registerLazySingleton(() => AuthRepository(FirebaseAuthSource()));
  }
}
