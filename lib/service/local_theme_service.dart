import 'package:shared_preferences/shared_preferences.dart';
import 'package:slicing_design/utils.dart';

const String themePreferenceKey = 'themePreferenceKey';

Future<ThemeModeEnum?> getThemePreference() async {
  final prefs = await SharedPreferences.getInstance();
  final themeModeString = prefs.getString(themePreferenceKey);
  return ThemeModeEnum.fromString(themeModeString);
}

Future<void> saveThemePreference(ThemeModeEnum? themeMode) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(themePreferenceKey, themeMode!.toShortString());
}
