import 'dart:math';

import 'package:cinemixe/core/contants/login_page/constants.dart';
import 'package:cinemixe/core/theme/app_theme.dart';
import 'package:cinemixe/core/widgets/text_flied.dart';
import 'package:cinemixe/feactures/authenthication/presentation/widgets/button.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //sized box
          SizedBox(
            height: AppTheme.of(context).spaces.space_900,
          ),
          Transform.translate(
            offset: Offset(MediaQuery.sizeOf(context).width * 0.8, 1),
            child: Transform(
              transform: Matrix4.identity()
                ..rotateZ(pi * -0.08)
                ..rotateY(0.0),
              child: Container(
                color: AppTheme.of(context).colors.primary,
                height: 100,
                width: 100,
              ),
            ),
          ),

          //textfield for email
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFieldWidget(
                hinttText: Loginpagetext.textfliedemail,
                prefixxIcon: Loginpagetext.emailprefixicon),
          ),

          //sized box
          SizedBox(
            height: AppTheme.of(context).spaces.space_400,
          ),

          //text field for password
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFieldWidget(
              hinttText: Loginpagetext.textfliedpassword,
              prefixxIcon: Loginpagetext.passwordprefixicon,
              suffixxIcon: Loginpagetext.passwordsuffixicon,
            ),
          ),

          //sized box
          SizedBox(
            height: AppTheme.of(context).spaces.space_400,
          ),

          //login button
          SignupLoginButton(buttonText: Loginpagetext.buttonlogin)
        ],
      ),
    );
  }
}
