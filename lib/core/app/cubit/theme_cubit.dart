import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/theme/light_theme/app_light_theme.dart';
import '../../resources/theme/theme_abstract_factory.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppThemeManager.setTheme(AppThemeLight()));

  void setTheme(ThemeData themeData) => emit(themeData);
}
