import 'package:cinemixe/feactures/authenthication/domain/repositories/auth_repository.dart';

final class LoginUsecase {
  final AuthRepository repository;
  LoginUsecase({required this.repository});

  Future<void> call(String email, String password) async {
    /// Verify email and password
    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw InvalidCredentialsException();
    }

    try {
      await repository.loginUser(email, password);
    } on Exception {
      throw AuthenticationFailedException('Cannot Login. Please try again.');
    }
  }
}
