import 'package:cinemixe/core/theme/color_palette.dart';
import 'package:cinemixe/core/theme/extentions/color_extention.dart';
import 'package:cinemixe/core/theme/extentions/space_extention.dart';
import 'package:cinemixe/core/theme/extentions/typography_extention.dart';
import 'package:flutter/material.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'light_theme.g.dart';

final _lightTheme = ThemeData(
  brightness: Brightness.light,
  extensions: [
    AppColorExtension(
      primary: Colors.blueGrey,
      secondary: AppColorPalette.yellow100,
      text: AppColorPalette.grey900,
      textInverse: Colors.white,
      textSubtle: AppColorPalette.grey700,
      textSubtlest: AppColorPalette.grey500,
      backgroundDanger: Colors.red,
      normaltext:Colors.black,
    ),
    AppSpaceExtension.fromBaseSpace(8),
    AppTypographyExtension.fromColors(
      defaultFontColor: AppColorPalette.grey900,
      linkColor: Colors.blue,
      dimFontColor: AppColorPalette.grey700,
    )
  ],
);

@riverpod
ThemeData lightTheme(LightThemeRef ref) {
  return _lightTheme;
}
