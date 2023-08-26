import 'package:flutter/material.dart';

abstract class AppTextTheme {
  final Color? primaryColor;
  late final TextTheme data;
  TextStyle? displayLarge;
  TextStyle? displayMedium;
  TextStyle? displaySmall;
  TextStyle? headlineLarge;
  TextStyle? headlineMedium;
  TextStyle? headlineSmall;
  TextStyle? titleLarge;
  TextStyle? titleMedium;
  TextStyle? titleSmall;
  TextStyle? labelLarge;
  TextStyle? labelMedium;
  TextStyle? labelSmall;
  TextStyle? bodyLarge;
  TextStyle? bodyMedium;
  TextStyle? bodySmall;

  AppTextTheme(this.primaryColor);
}
