import 'package:cinemixe_app/core/exceptions/base_exception.dart';
import 'package:cinemixe_app/feactures/authenthication/domain/repositories/auth_repository.dart';

final class EmailVerificationUsecase {
  final AuthRepository repository;
  EmailVerificationUsecase({required this.repository});
  Future<void> call() async {
    try {
      await repository.emailVerify();
    } on Exception {
      throw BaseException('Cant verify');
    }
  }
}
