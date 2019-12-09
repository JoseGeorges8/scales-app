import 'package:flutter/material.dart';
import 'package:scales_app/data_providers/theme_data_provider/theme_base_provider.dart';

class ThemeRepository{

  final ThemeBaseProvider provider;

  ThemeRepository({@required this.provider});

  Future<String> getCurrentTheme() => provider.getCurrentTheme();
  Future<bool> setTheme({String theme}) => provider.setTheme(theme);

}