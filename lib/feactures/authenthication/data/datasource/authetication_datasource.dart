import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenthicationDataSoucre {
  Future<UserCredential> login(String password, String email);
  Future<UserCredential> signup(String password, String email);
}
