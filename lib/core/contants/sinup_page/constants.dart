import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'constants.g.dart';

final class SignupPageConstants {
  //phone Number

  final phoneNumber = "Phone Number";
  final phoneNumberlabel = "Enter your Phone Number";
  //login page genaral texts
  final pageTittle = "CREATE YOUR ACCOUNT";
  final copyRigthText = "©️copyrigth by RASS MEDIA";
  //login page text feild hint text
  final textfliedemail = "EMAIL";
  final textfliedpassword = "PASSWORD";
  final textfliedphone = "Enter Your Phone Number";

  //login page text feild icons
  final emailprefixicon = const Icon(Icons.email);
  final passwordprefixicon = const Icon(Icons.fingerprint);
  final passwordsuffixicon = const Icon(Icons.remove_red_eye_sharp);
  final phoneprefixicon = const Icon(Icons.phone);
  final phonesuffixicon = const Icon(Icons.phone);

  //login page buttons
  final buttonsignup = "SIGNUP";
  final buttongoogle = "GOOGLE";
  final buttonforgotpassword = "FORGOT PASSWORD";
  final buttonalreadylogin = "Alerady login";

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
