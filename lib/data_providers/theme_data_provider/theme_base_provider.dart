import 'package:flutter/material.dart';

abstract class ThemeBaseProvider{

  Future<String> getCurrentTheme();

  Future<bool> setTheme(String theme);

}