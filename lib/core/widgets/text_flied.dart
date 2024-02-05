import 'package:cinemixe_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hinttText;
  final TextEditingController controller;
  final Widget? prefixxIcon;
  final Widget? suffixxIcon;

  const TextFieldWidget(
      {super.key,
      required this.hinttText,
      required this.prefixxIcon,
      this.suffixxIcon,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),

      controller: controller,  
      cursorColor: Colors.white,
      // AppTheme.of(context).colors.text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: AppTheme.of(context).spaces.space_250,
            vertical: AppTheme.of(context).spaces.space_200),
        hintText: hinttText,
        hintStyle: const TextStyle(color: Colors.white),
        suffixIcon: suffixxIcon,
        prefixIcon: prefixxIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppTheme.of(context).colors.textSubtle),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppTheme.of(context).colors.textSubtle),
        ),
      ),
    );
  }
}
