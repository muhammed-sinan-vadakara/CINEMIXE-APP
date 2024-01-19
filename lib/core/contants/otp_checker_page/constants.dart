import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'constants.g.dart';

final class OtpCheckingPagetext {
  //app bar
  final tittle = "OTP VERIFICATION";
  final settings = const Icon(Icons.settings);
  //textfleid
  final hinttext = "Enter your OTP";
  final prefixxIcon = const Icon(Icons.password);
  final suffixxIcon = const Icon(Icons.remove_red_eye_outlined);
  //body
  final heading = "OTP";
  //Button
  final buttontext = "VERIFY";
}

@riverpod
OtpCheckingPagetext otpcheckingpagetext(OtpcheckingpagetextRef ref) {
  return OtpCheckingPagetext();
}
