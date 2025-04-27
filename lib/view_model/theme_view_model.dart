
import 'package:flutter/material.dart';
import 'package:slicing_design/service/local_theme_service.dart';
import 'package:slicing_design/theme.dart';
import 'package:slicing_design/utils.dart';

class ThemesViewModel extends ChangeNotifier {
  final ThemeData _baseThemeData = ThemeConfig().setTheme(
    fontFamily: 'Inter',
    colorTheme: ColorThemeEnum.defaultTheme,
    brightness: Brightness.light,
  );
  final ThemeData _baseDarkThemeData = ThemeConfig().setTheme(
    fontFamily: 'Inter',
    colorTheme: ColorThemeEnum.defaultTheme,
    brightness: Brightness.dark,
  );

  ThemeData? _dynamicTheme;
  ThemeData? _dynamicDarkTheme;

  ThemeData get themeData => _dynamicTheme ?? _baseThemeData;
  ThemeData get darkThemeData => _dynamicDarkTheme ?? _baseDarkThemeData;

  ThemeModeEnum? _themeModeEnum = ThemeModeEnum.system;
  ThemeModeEnum? get themeModeEnum => _themeModeEnum;

  ThemeMode get themeMode => setThemeMode(_themeModeEnum);

  void setTheme(
      {required ColorThemeEnum colorTheme, required String fontFamily}) async {
    final newLightTheme = ThemeConfig().setTheme(
      fontFamily: fontFamily.isEmpty ? "Inter" : fontFamily,
      colorTheme: colorTheme,
      brightness: Brightness.light,
    );

    final newDarkTheme = ThemeConfig().setTheme(
      fontFamily: fontFamily.isEmpty ? "Inter" : fontFamily,
      colorTheme: colorTheme,
      brightness: Brightness.dark,
    );

    await Future.delayed(const Duration(milliseconds: 900));
    _dynamicTheme = newLightTheme;
    _dynamicDarkTheme = newDarkTheme;
    notifyListeners();
  }

  void resetTheme() async {
    await Future.delayed(const Duration(milliseconds: 900));
    _dynamicTheme = null;
    _dynamicDarkTheme = null;
    notifyListeners();
  }

  Future<ThemeModeEnum?> getThemeMode() async {
    _themeModeEnum = await getThemePreference();
    notifyListeners();
    return _themeModeEnum;
  }

  Future<void> saveThemeMode(ThemeModeEnum? themeMode) async {
    _themeModeEnum = themeMode;
    await saveThemePreference(themeMode);
    notifyListeners();
  }

  ThemeMode setThemeMode(ThemeModeEnum? themeMode) {
    switch (themeMode) {
      case ThemeModeEnum.light:
        return ThemeMode.light;
      case ThemeModeEnum.dark:
        return ThemeMode.dark;
      case ThemeModeEnum.system:
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }
}

