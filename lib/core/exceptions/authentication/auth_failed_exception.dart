import 'package:cinemixe_app/core/exceptions/base_exception.dart';

final class AuthenticationFailedException extends BaseException {
  AuthenticationFailedException(String reason) : super(reason);
}
