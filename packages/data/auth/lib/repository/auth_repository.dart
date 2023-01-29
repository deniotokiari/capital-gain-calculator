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
      } else if (e.code == 'invalid-email') {
        return CreateUserResult.invalidEmail;
      } else if (e.code == 'operation-not-allowed') {
        return CreateUserResult.operationNotAllowed;
      } else {
        return CreateUserResult.failed;
      }
    } catch (_) {
      return CreateUserResult.failed;
    }
  }

  Future<SignInResult> signIn(Credential credential) async {
    try {
      await _firebaseAuthSource.signInWithEmailAndPassword(email: credential.email, password: credential.password);

      return SignInResult.success;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          return SignInResult.invalidEmail;
        case 'user-disabled':
          return SignInResult.userDisabled;
        case 'user-not-found':
          return SignInResult.userNotFound;
        case 'wrong-password':
          return SignInResult.wrongPassword;
      }

      return SignInResult.failed;
    } catch (_) {
      return SignInResult.failed;
    }
  }

  bool get isSignIn => _firebaseAuthSource.isSignIn;

  String? get userEmail => _firebaseAuthSource.userEmail;
}

enum CreateUserResult {
  success,
  failed,
  weakPassword,
  emailAlreadyInUse,
  invalidEmail,
  operationNotAllowed;
}

enum SignInResult {
  success,
  failed,
  userNotFound,
  wrongPassword,
  invalidEmail,
  userDisabled;
}
