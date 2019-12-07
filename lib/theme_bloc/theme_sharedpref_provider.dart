import 'package:flutter/src/material/theme_data.dart';
import 'package:scales_app/theme_bloc/theme_base_provider.dart';
import 'package:scales_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSharedPrefProvider extends ThemeBaseProvider{

  @override
  Future<bool> setTheme(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await prefs.setString(THEME_KEY, theme);
    return result;
  }

  @override
  Future<String> getCurrentTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String theme = prefs.getString(THEME_KEY);
    return theme ?? PIANO_THEME_OPTION;
  }

}