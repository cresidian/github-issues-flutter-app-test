import 'package:github_issues_flutter_app_test/core/resources/colors.dart';
import 'package:github_issues_flutter_app_test/core/resources/theme/app_theme_abstract.dart';
import 'package:github_issues_flutter_app_test/core/resources/theme/colors_theme_abstract.dart';
import 'package:github_issues_flutter_app_test/core/resources/theme/light_theme/light_colors_theme.dart';
import 'package:github_issues_flutter_app_test/core/resources/theme/light_theme/light_text_theme.dart';
import 'package:github_issues_flutter_app_test/core/resources/theme/text_theme_abstract.dart';

class AppThemeLight extends AppTheme {
  @override
  late final AppTextTheme textTheme;
  @override
  AppColorsTheme get colors => LightColors();

  AppThemeLight() {
    textTheme = TextThemeLight(AppColors.headlineTextColor);
  }
}
