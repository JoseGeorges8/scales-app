import 'package:flutter/material.dart';

import 'constants.dart';

final appThemeData = {
  PIANO_THEME_OPTION: AppThemes.pianoTheme,
  DRUMPAD_THEME_OPTION: AppThemes.drumpadTheme
};

class AppThemes {
  static ThemeData get pianoTheme {
    return ThemeData(
        appBarTheme: AppBarThemes.pianoTheme,
        textTheme: TextThemes.pianoTheme,
        primaryColor: pianoPrimaryColor,
        accentColor: pianoAccentColor,
        backgroundColor: pianoBackgroundColor,
        scaffoldBackgroundColor: pianoBackgroundColor,
    );
  }

  static ThemeData get drumpadTheme {
    return ThemeData(
        appBarTheme: AppBarThemes.drumpadTheme,
        textTheme: TextThemes.drumpadTheme,
        cardTheme: CardTheme(color: drumpadCardColor),
        primaryColor: drumpadPrimaryColor,
        accentColor: drumpadAccentColor,
        backgroundColor: drumpadBackgroundColor,
        scaffoldBackgroundColor: drumpadBackgroundColor
    );
  }
}

class AppBarThemes{

  static AppBarTheme get pianoTheme{
    return  AppBarTheme(
        color: Colors.transparent,
        textTheme: TextThemes.pianoTheme,
    );
  }

  static AppBarTheme get drumpadTheme{
    return  AppBarTheme(
        color: Colors.transparent,
        textTheme: TextThemes.drumpadTheme
    );
  }


}

class TextThemes{

  static TextTheme get pianoTheme{
    return TextTheme(
        title: TextStyle(color: pianoAccentColor, fontSize: 20)
    );
  }
  static TextTheme get drumpadTheme{
    return TextTheme(
        title: TextStyle(color: drumpadAccentColor, fontSize: 20)
    );
  }


}
