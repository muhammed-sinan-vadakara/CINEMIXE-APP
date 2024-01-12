import 'package:cinemixe/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SignupLoginButton extends StatelessWidget {
  final String? buttonText;
  const SignupLoginButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 356,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.of(context).colors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
          onPressed: () {},
          child: Text(buttonText!)),
    );
  }
}
