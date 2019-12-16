import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:scales_app/blocs/theme_bloc/theme_repository.dart';
import 'package:scales_app/data_providers/theme_data_provider/theme_sharedpref_provider.dart';
import 'package:scales_app/utils/themes.dart';
import './bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {

  final List<String> themes = ['Piano', 'Drumpad'];


  String currentTheme;
  final ThemeRepository _repository = ThemeRepository(provider: ThemeSharedPrefProvider());

  ///This initial state should be defined by shared pref
  @override
  ThemeState get initialState {
    initialize();
    return ThemeState.loading();
  }

  initialize() async {
    currentTheme = await _repository.getCurrentTheme();
    this.add(AppInitialized());
  }

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is AppThemeChanged) {
      currentTheme = event.theme;
      _repository.setTheme(theme: event.theme);
      yield ThemeState(value: currentTheme, theme: appThemeData[event.theme]);
    }
    if (event is AppInitialized) {
      yield ThemeState(value: currentTheme, theme: appThemeData[currentTheme]);
    }
  }

}