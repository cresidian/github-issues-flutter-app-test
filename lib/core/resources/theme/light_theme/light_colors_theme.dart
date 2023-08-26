import 'package:flutter/material.dart';
import 'package:github_issues_flutter_app_test/core/resources/colors.dart';
import 'package:github_issues_flutter_app_test/core/resources/theme/colors_theme_abstract.dart';

class LightColors implements AppColorsTheme {
  @override
  ColorScheme? colorScheme;

  @override
  Color? canvasColor;

  @override
  Color? primarySwatch;

  @override
  Brightness? brightness;

  @override
  Color? appBarColor;

  LightColors() {
    primarySwatch = AppColors.primaryColor;
    colorScheme = const ColorScheme.light().copyWith(
      primary: AppColors.primaryColor,
      secondary: AppColors.accentColor,
      error: AppColors.errorColor,
    );
    brightness = Brightness.light;
    appBarColor = AppColors.textColorWhite;
  }
}
