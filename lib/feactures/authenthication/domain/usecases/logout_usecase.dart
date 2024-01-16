import 'package:cinemixe/core/exceptions/authentication/auth_failed_exception.dart';
import 'package:cinemixe/feactures/authenthication/domain/repositories/auth_repository.dart';

final class LogoutUsecase {
  final AuthRepository repository;
  LogoutUsecase({required this.repository});

  Future<void> call() async {
    try {
      await repository.logout();
    } on Exception {
      throw AuthenticationFailedException(
          'Cannot logout. Please check your network');
    }
  }
}
