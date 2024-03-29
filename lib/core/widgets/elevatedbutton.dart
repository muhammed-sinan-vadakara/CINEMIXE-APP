import 'package:cinemixe_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ElevatedButtonWidgetConst extends ConsumerWidget {
  const ElevatedButtonWidgetConst({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.of(context).colors.textInverse,
          elevation: 0.5,
          padding: EdgeInsets.symmetric(
              vertical: AppTheme.of(context).spaces.space_100),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.network(
            // ref.watch(logConstProvider).logolink,
            // width: AppTheme.of(context).spaces.space_400,
            // ),
            SizedBox(
              width: AppTheme.of(context).spaces.space_200,
            ),
            // Text(
            //   ref.watch(logConstProvider).btn2,
            //   style: AppTheme.of(context).typography.h400,
            // ),
          ],
        ));
  }
}
