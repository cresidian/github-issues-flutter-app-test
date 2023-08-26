import 'package:flutter/material.dart';
import 'package:github_issues_flutter_app_test/core/resources/colors.dart';
import 'package:github_issues_flutter_app_test/core/resources/theme/text_theme_abstract.dart';

class TextThemeLight implements AppTextTheme {
  @override
  late final TextTheme data;

  @override
  TextStyle? bodyLarge;

  @override
  TextStyle? bodyMedium;

  @override
  TextStyle? bodySmall;

  @override
  TextStyle? displayLarge;

  @override
  TextStyle? displayMedium;

  @override
  TextStyle? displaySmall;

  @override
  TextStyle? headlineLarge;

  @override
  TextStyle? headlineMedium;

  @override
  TextStyle? headlineSmall;

  @override
  TextStyle? labelLarge;

  @override
  TextStyle? labelMedium;

  @override
  TextStyle? labelSmall;

  @override
  TextStyle? titleLarge;

  @override
  TextStyle? titleMedium;

  @override
  TextStyle? titleSmall;

  @override
  final Color? primaryColor;

  TextThemeLight(this.primaryColor) {
    data = TextTheme(
      displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
        color: primaryColor,
      ),
      displayMedium: TextStyle(
          fontSize: 45, fontWeight: FontWeight.w700, color: primaryColor),
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: primaryColor,
      ),
      headlineLarge: TextStyle(
          fontSize: 32, fontWeight: FontWeight.w400, color: primaryColor),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w500,
        color: AppColors.headlineTextColor,
      ),
      headlineSmall: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w400, color: primaryColor),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: primaryColor,
      ),
      titleMedium: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.15,
          color: primaryColor),
      titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          color: primaryColor),
      labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.1,
          color: primaryColor),
      labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: primaryColor),
      labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: primaryColor),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: primaryColor,
      ),
      bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: primaryColor),
      bodySmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w400, color: primaryColor),
    ).apply(bodyColor: primaryColor);
  }
}
