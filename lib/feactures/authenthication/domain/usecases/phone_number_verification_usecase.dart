import 'package:cinemixe/core/exceptions/authentication/auth_failed_exception.dart';
import 'package:cinemixe/feactures/authenthication/domain/repositories/auth_repository.dart';

final class PhoneNumberVerificationUsecase {
  final AuthRepository repository;
  PhoneNumberVerificationUsecase({required this.repository});

  Future<void> call(String phoneNumber) async {
    try {
      await repository.phoneNumberVerificationbyOtp(phoneNumber);
    } on Exception {
      throw AuthenticationFailedException(
          'Cannot send the otp to your phone number \n please put your correct phone number');
    }
  }
}
