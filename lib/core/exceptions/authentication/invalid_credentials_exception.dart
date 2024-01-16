import 'package:cinemixe/core/exceptions/base_exception.dart';

final class InvalidCredentialsException extends BaseException {
  InvalidCredentialsException() : super('Invalid user input');
}
