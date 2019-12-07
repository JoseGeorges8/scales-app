import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scales_app/theme_bloc/bloc.dart';
import 'package:scales_app/utils/constants.dart';
import 'package:scales_app/utils/themes.dart';
import 'package:scales_app/widgets/home_app_bar.dart';
import 'package:scales_app/widgets/settings_row.dart';

class SettingsPage extends StatefulWidget{

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

const themes = ['Piano', 'Drumpad'];

class _SettingsPageState extends State<SettingsPage> {
   ThemeBloc _themeBloc;

   @override
  void initState() {
     _themeBloc = BlocProvider.of<ThemeBloc>(context);
     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        title: SETTINGS_TITLE,
      ),
      body: ListView.builder(
          itemCount: appThemeData.length,
          itemBuilder: (BuildContext context, int index){
            return SettingsRow(
              isSelected: _themeBloc.currentTheme == themes[index],
              title: themes[index],
              onRowPressed: () => _onSettingsRowPressed(themes[index]),
            );
          }
      ),
    );
  }

  _onSettingsRowPressed(String theme) {
     _themeBloc.add(AppThemeChanged(theme: theme));
  }
}