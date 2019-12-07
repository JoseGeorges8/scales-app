import 'package:flutter/material.dart';
import 'package:scales_app/pages/settings.dart';
import 'package:scales_app/utils/constants.dart';
import 'package:scales_app/widgets/home_app_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        title: HOME_TITLE,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage())))
        ],
      ),
    );
  }
}
