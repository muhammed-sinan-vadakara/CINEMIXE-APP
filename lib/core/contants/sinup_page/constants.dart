import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'constants.g.dart';

final class SignupPageConstants {
  //login page text feild hint text
  static String? textfliedemail = "EMAIL";
  static String? textfliedpassword = "PASSWORD";

  //login page text feild icons
  static Widget? emailprefixicon = const Icon(Icons.email);
  static Widget? passwordprefixicon = const Icon(Icons.fingerprint);
  static Widget? passwordsuffixicon = const Icon(Icons.remove_red_eye_sharp);

  //login page buttons
  static String? buttonlogin = "LOGIN";
  static String? buttonforgotpassword = "FORGOT PASSWORD";
  static String? buttoncreateaccount = "CREATE NEW ACCOUNT";

  //sir code
  final txtHomeTitle = 'Home';
  final txtLoginTitle = 'Login';
  final txtSignupTitle = 'Signup';
  final txtEmailLabel = 'Email';
  final txtEmailPlaceholder = 'Enter your email';
  final txtPasswordLabel = 'Password';
  final txtPasswordPlaceholder = 'Enter new password';
  final txtSignupBtnLabel = 'Create Account';
}

@riverpod
SignupPageConstants signupPageConstants(SignupPageConstantsRef ref) {
  return SignupPageConstants();
}
