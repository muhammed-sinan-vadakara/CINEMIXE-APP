import 'package:cinemixe_app/core/exceptions/base_exception.dart';
import 'package:cinemixe_app/feactures/authenthication/domain/repositories/auth_repository.dart';

final class GoogleVerificationUsecase {
  final AuthRepository repository;
  GoogleVerificationUsecase({required this.repository});

  Future<void> call() async {
    try {
      await repository.googleverifications();
    } on Exception {
      throw BaseException('cannot login with google');
    }
  }
}
