import 'package:cinemixe/core/theme/extentions/color_extention.dart';
import 'package:cinemixe/core/theme/extentions/space_extention.dart';
import 'package:cinemixe/core/theme/extentions/typography_extention.dart';
import 'package:flutter/material.dart';

final class AppTheme {
  final BuildContext context;

  AppTheme.of(this.context);

  AppColorExtension get colors {
    return Theme.of(context).extension<AppColorExtension>()!;
  }

  AppSpaceExtension get spaces {
    return Theme.of(context).extension<AppSpaceExtension>()!;
  }

  AppTypographyExtension get typography {
    return Theme.of(context).extension<AppTypographyExtension>()!;
  }
}
