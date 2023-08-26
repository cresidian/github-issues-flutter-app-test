import 'package:flutter/material.dart';
import 'package:github_issues_flutter_app_test/core/resources/colors.dart';
import 'package:github_issues_flutter_app_test/core/resources/theme/colors_theme_abstract.dart';

class DarkColors implements AppColorsTheme {
  @override
  ColorScheme? colorScheme;

  @override
  Brightness? brightness;

  @override
  Color? canvasColor;

  @override
  Color? primarySwatch;

  @override
  Color? appBarColor;

  DarkColors() {
    primarySwatch = AppColors.primaryColor;
    colorScheme = const ColorScheme.dark().copyWith(
      primary: AppColors.primaryColor,
      secondary: AppColors.accentColor,
    );
    brightness = Brightness.dark;
    appBarColor = AppColors.textColorWhite;
  }
}
