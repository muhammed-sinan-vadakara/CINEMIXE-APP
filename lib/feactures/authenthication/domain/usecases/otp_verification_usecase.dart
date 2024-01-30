import 'package:cinemixe/core/exceptions/authentication/invalid_credentials_exception.dart';
import 'package:cinemixe/core/exceptions/base_exception.dart';
import 'package:cinemixe/feactures/authenthication/domain/repositories/auth_repository.dart';

final class VerifyOtpUsecase {
  final AuthRepository repository;
  VerifyOtpUsecase({required this.repository});
  Future<void> call(String verificationId, String otp) async {
    if (otp.trim().isEmpty) {
      throw InvalidCredentialsException();
    }
    try {
      await repository.verifyPhoneOtp(verificationId, otp);
    } on Exception {
      throw BaseException('Enter your otp correctly,try again');
    }
  }
}
