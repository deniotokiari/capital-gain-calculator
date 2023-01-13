import 'package:auth/repository/credential.dart';
import 'package:auth/source/firebase_auth_source.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuthSource _firebaseAuthSource;

  AuthRepository(this._firebaseAuthSource);

  Future<CreateUserResult> createUser(Credential credential) async {
    try {
      await _firebaseAuthSource.createUserWithEmailAndPassword(
        email: credential.email,
        password: credential.password,
      );

      return CreateUserResult.success;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return CreateUserResult.weakPassword;
      } else if (e.code == 'email-already-in-use') {
        return CreateUserResult.emailAlreadyInUse;
      } else {
        return CreateUserResult.failed;
      }
    } catch (_) {
      return CreateUserResult.failed;
    }
  }
}

enum CreateUserResult {
  success,
  failed,
  weakPassword,
  emailAlreadyInUse;
}

enum SignInResult {
  success,
  failed,
  userNotFound,
  wrongPassword,
}
