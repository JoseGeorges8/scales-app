import 'package:flutter/material.dart';

import 'constants.dart';

final appThemeData = {
  PIANO_THEME_OPTION: AppThemes.pianoTheme,
  DRUMPAD_THEME_OPTION: AppThemes.drumpadTheme
};

class AppThemes {
  static ThemeData get pianoTheme {
    return ThemeData(
        appBarTheme: AppBarTheme(color: Colors.transparent),
        primaryColor: pianoPrimaryColor,
        accentColor: pianoAccentColor,
        backgroundColor: pianoBackgroundColor,
        scaffoldBackgroundColor: pianoBackgroundColor,
    );
  }

  static ThemeData get drumpadTheme {
    return ThemeData(
        appBarTheme: AppBarTheme(color: Colors.transparent),
        scaffoldBackgroundColor: Colors.redAccent);
  }
}
