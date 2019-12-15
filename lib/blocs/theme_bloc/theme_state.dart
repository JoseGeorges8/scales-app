import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scales_app/utils/constants.dart';
import 'package:scales_app/utils/themes.dart';

class ThemeState extends Equatable {
  final String value;
  final ThemeData theme;
  final bool isLoading;

  const ThemeState({@required this.value, @required this.theme, this.isLoading = false})
      : assert(theme != null);

  factory ThemeState.loading() => ThemeState(value: PIANO_THEME_OPTION, theme: AppThemes.pianoTheme, isLoading: true);
  factory ThemeState.piano() => ThemeState(value: PIANO_THEME_OPTION, theme: AppThemes.pianoTheme);
  factory ThemeState.drumpad() => ThemeState(value: DRUMPAD_THEME_OPTION, theme: AppThemes.drumpadTheme);

  @override
  List<Object> get props => [theme];
}

