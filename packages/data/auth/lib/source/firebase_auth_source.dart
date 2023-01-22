import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthSource {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) =>
      firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) =>
      firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
}
