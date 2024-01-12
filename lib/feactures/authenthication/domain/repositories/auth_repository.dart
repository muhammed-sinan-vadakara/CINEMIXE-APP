import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserCredential> login(String password, String email);
  Future<UserCredential> signup(String password, String email);
}
