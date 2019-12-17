import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scales_app/blocs/sound_bloc/bloc.dart';
import 'package:scales_app/blocs/theme_bloc/bloc.dart';
import 'package:scales_app/utils/constants.dart';
import 'package:scales_app/utils/themes.dart';
import 'package:scales_app/widgets/home_app_bar.dart';
import 'package:scales_app/widgets/settings_row.dart';
import 'package:scales_app/widgets/texts.dart';

class SettingsPage extends StatefulWidget{

  @override
  _SettingsPageState createState() => _SettingsPageState();
}


class _SettingsPageState extends State<SettingsPage> {
   ThemeBloc _themeBloc;
   SoundBloc _soundBloc;

   @override
  void initState() {
     _themeBloc = BlocProvider.of<ThemeBloc>(context);
     _soundBloc = BlocProvider.of<SoundBloc>(context);
     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        title: SETTINGS_TITLE,
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ListHeadingText('Themes'),
            ],
          ),
          Column(
            children: _themeBloc.themes.map((theme) => SettingsRow(
              onRowPressed: () => _onSettingsRowPressed(theme),
              title: theme,
              isSelected: _themeBloc.currentTheme == theme,

            )).toList(),
          ),
          Row(
            children: <Widget>[
              ListHeadingText('Sounds'),
            ],
          ),
        ],
      ),
    );
  }

  _onSettingsRowPressed(String theme) {
     _themeBloc.add(AppThemeChanged(theme: theme));
  }

  _onSoundsRowPressed(String sound){
     _soundBloc.changeSound(sound);
  }
}