import 'package:flutter/material.dart';
import 'package:github_issues_flutter_app_test/core/resources/colors.dart';
import 'package:github_issues_flutter_app_test/core/resources/theme/app_theme_abstract.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppThemeManager {
  static ThemeData setTheme(AppTheme appTheme) => ThemeData(
        // useMaterial3: true,
        fontFamily: GoogleFonts.dmSans().fontFamily,
        textTheme: appTheme.textTheme.data,
        canvasColor: appTheme.colors.canvasColor,
        primaryColor: appTheme.colors.primarySwatch,
        appBarTheme: AppBarTheme(
          backgroundColor: appTheme.colors.appBarColor,
          elevation: 0,
          titleTextStyle: appTheme.textTheme.headlineMedium?.copyWith(
            fontSize: 20,
            color: AppColors.headlineTextColor,
          ),
          iconTheme: IconThemeData(
            color: appTheme.colors.appBarColor,
          ),
        ),
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
        ),

        colorScheme: appTheme.colors.colorScheme,
      );
}
