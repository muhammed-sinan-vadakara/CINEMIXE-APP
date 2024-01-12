import 'package:cinemixe/feactures/authenthication/data/datasource/authetication_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenthicationDataSoucreImpl implements AuthenthicationDataSoucre {
  final FirebaseAuth _auth;
  AuthenthicationDataSoucreImpl(this._auth);
  @override
  Future<UserCredential> login(String password, String email) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<UserCredential> signup(String password, String email) {
    return _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
