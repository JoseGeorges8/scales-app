import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scales_app/utils/themes.dart';

class ThemeState extends Equatable {
  final ThemeData theme;
  final bool isLoading;

  const ThemeState({@required this.theme, this.isLoading = false})
      : assert(theme != null);

  factory ThemeState.loading() => ThemeState(theme: AppThemes.pianoTheme, isLoading: true);
  factory ThemeState.piano() => ThemeState(theme: AppThemes.pianoTheme);
  factory ThemeState.drumpad() => ThemeState(theme: AppThemes.drumpadTheme);

  @override
  List<Object> get props => [theme];
}

