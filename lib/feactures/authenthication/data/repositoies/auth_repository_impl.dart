import 'package:cinemixe/feactures/authenthication/data/datasource/authentication_datasource_impl.dart';
import 'package:cinemixe/feactures/authenthication/data/datasource/authetication_datasource.dart';
import 'package:cinemixe/feactures/authenthication/domain/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_impl.g.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource datasource;
  AuthRepositoryImpl({required this.datasource});

  @override
  Future<void> createAccount(String email, String password) async {
    await datasource.createAccount(email, password);
  }

  @override
  Future<void> loginUser(String email, String password) async {
    await datasource.loginUser(email, password);
  }

  @override
  Future<void> logout() async {
    await datasource.logout();
  }

  @override
  Future<void> emailVerify() async {
    await datasource.emailVerfication();
  }

  @override
  Future<void> resetPasswordbyemail(String email) async {
    await datasource.resetPassword(email);
  }

  @override
  Future<void> googleverifications() async {
    await datasource.googleverification();
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(
      datasource: ref.watch(firebaseAuthDataSourceProvider));
}
