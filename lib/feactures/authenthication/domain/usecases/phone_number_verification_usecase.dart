import 'package:cinemixe_app/core/exceptions/authentication/auth_failed_exception.dart';
import 'package:cinemixe_app/core/exceptions/authentication/invalid_credentials_exception.dart';
import 'package:cinemixe_app/feactures/authenthication/domain/repositories/auth_repository.dart';

final class PhoneNumberVerificationUsecase {
  final AuthRepository repository;
  PhoneNumberVerificationUsecase({required this.repository});

  Future<(String, int?)> call(String phoneNumber) async {
    if (phoneNumber.trim().isEmpty) {
      throw InvalidCredentialsException();
    }
    try {
      return await repository.phoneNumberVerificationbyOtp(phoneNumber);
    } on Exception {
      throw AuthenticationFailedException(
          'Cannot send the otp to your phone number \n please put your correct phone number');
    }
  }
}
