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
          SizedBox(
            height: 20,
          ),
          Transform.translate(
            offset: Offset(MediaQuery.sizeOf(context).width * 0.8, 1),
            child: Transform(
              transform: Matrix4.identity()
                ..rotateZ(pi * -0.08)
                ..rotateY(0.0),
              child: Container(
                color: Colors.red,
                height: 100,
                width: 100,
              ),
            ),
          ),
          TextFieldWidget(
              hinttText: login_page_text.text_flied_email,
              prefixxIcon: login_page_text.email_prefixicon),
          SizedBox(
            height: AppTheme.of(context).spaces.space_400,
          ),
          TextFieldWidget(
            hinttText: login_page_text.text_flied_password,
            prefixxIcon: login_page_text.password_prefixicon,
            suffixxIcon: login_page_text.password_suffixicon,
          ),
          SignupLoginButton(buttonText: login_page_text.button_login)
        ],
      ),
    );
  }
}
