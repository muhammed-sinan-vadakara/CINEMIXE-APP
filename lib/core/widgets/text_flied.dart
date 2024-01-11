import 'package:cinemixe/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? text;
  const TextFieldWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppTheme.of(context).colors.text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: AppTheme.of(context).spaces.space_250,
            vertical: AppTheme.of(context).spaces.space_200),
        hintText: text,
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
