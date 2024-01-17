abstract class FirebaseAuthDataSource {
  Future<void> loginUser(String email, String password);
  Future<void> createAccount(String email, String password);
  Future<void> logout();
  Future<void> emailVerfication();
  Future<void> resetPassword(String email);
}
















// import 'package:firebase_auth/firebase_auth.dart';

// abstract class AuthenthicationDataSoucre {
//   Future<UserCredential> loginUser(String password, String email);
//   Future<UserCredential> createAccount(String password, String email);
//   Future<void> logout();
// }
