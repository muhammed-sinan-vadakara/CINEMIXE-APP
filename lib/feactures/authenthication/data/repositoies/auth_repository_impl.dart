import 'package:cinemixe/feactures/authenthication/data/datasource/authetication_datasource.dart';
import 'package:cinemixe/feactures/authenthication/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthenthicationDataSoucre dataSoucre;
  AuthRepositoryImpl({required this.dataSoucre});
  @override
  Future<UserCredential> login(String password, String email) {
    return dataSoucre.login(password, email);
  }

  @override
  Future<UserCredential> signup(String password, String email) {
    return dataSoucre.signup(password, email);
  }
}
