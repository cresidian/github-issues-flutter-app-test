import 'package:github_issues_flutter_app_test/core/resources/colors.dart';
import 'package:github_issues_flutter_app_test/core/resources/theme/app_theme_abstract.dart';
import 'package:github_issues_flutter_app_test/core/resources/theme/dark_theme/dark_colors_theme.dart';
import 'package:github_issues_flutter_app_test/core/resources/theme/dark_theme/dark_text_theme.dart';
import 'package:github_issues_flutter_app_test/core/resources/theme/text_theme_abstract.dart';

import '../colors_theme_abstract.dart';

class AppThemeDark extends AppTheme {
  @override
  late final AppTextTheme textTheme;

  AppThemeDark() {
    textTheme = TextThemeDark(AppColors.headlineTextColor);
  }

  @override
  AppColorsTheme get colors => DarkColors();
}
