import 'package:cinemixe/core/exceptions/authentication/auth_failed_exception.dart';
import 'package:cinemixe/core/exceptions/authentication/invalid_credentials_exception.dart';
import 'package:cinemixe/feactures/authenthication/domain/repositories/auth_repository.dart';

final class SignupUsecase {
  final AuthRepository repository;
  SignupUsecase({required this.repository});

  Future<void> call(String email, String password) async {
    /// Verify email and password
    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw InvalidCredentialsException();
    }

    try {
      await repository.createAccount(email, password);
    } on Exception {
      throw AuthenticationFailedException('Cannot signup. Please try again.');
    }
  }
}
