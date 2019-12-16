import 'package:flutter/material.dart';

class SettingsRow extends StatelessWidget{

  final Function onRowPressed;
  final bool isSelected;
  final String title;

  const SettingsRow({Key key, @required this.onRowPressed, this.title,this.isSelected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      textColor: Theme.of(context).accentColor,
      iconColor: Theme.of(context).accentColor,
      child: ListTile(
        onTap: isSelected ? null : onRowPressed,
        title: Text(title),
        trailing: isSelected ? Icon(Icons.check) : null,
      ),
    );
  }

}