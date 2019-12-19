import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:scales_app/utils/themes.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class AppInitialized extends ThemeEvent{
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'AppInitialized{}';
  }

}

class AppThemeChanged extends ThemeEvent {
  final String theme;

  const AppThemeChanged({@required this.theme}) : assert(theme != null);

  @override
  List<Object> get props => [theme];
}
