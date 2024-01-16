import 'package:cinemixe/core/exceptions/authentication/auth_failed_exception.dart';
import 'package:cinemixe/feactures/authenthication/data/datasource/authetication_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_datasource_impl.g.dart';

final class FirebaseAuthDataSourceImpl implements FirebaseAuthDataSource {
  @override
  Future<void> createAccount(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthenticationFailedException(
            'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw AuthenticationFailedException(
            'The account already exists for this email.');
      } else {
        throw AuthenticationFailedException('Cannot signup. Please try again');
      }
    }
  }

  @override
  Future<void> loginUser(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthenticationFailedException('Wrong email address');
      } else if (e.code == 'wrong-password') {
        throw AuthenticationFailedException('Wrong password');
      } else if (e.code == 'user-disabled') {
        throw AuthenticationFailedException('User is disabled. Cannot login');
      } else {
        throw AuthenticationFailedException('Cannot login. Please try again');
      }
    }
  }

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}

@riverpod
FirebaseAuthDataSource firebaseAuthDataSource(FirebaseAuthDataSourceRef ref) {
  return FirebaseAuthDataSourceImpl();
}
