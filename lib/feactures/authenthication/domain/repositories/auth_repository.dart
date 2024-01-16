abstract class AuthRepository {
  Future<void> loginUser(String email, String password);
  Future<void> createAccount(String email, String password);
  Future<void> logout();
}







// import 'package:firebase_auth/firebase_auth.dart';

// abstract class AuthRepository {
//   Future<UserCredential> login(String password, String email);
//   Future<UserCredential> signup(String password, String email);
//   Future<void> singOut();
// }
