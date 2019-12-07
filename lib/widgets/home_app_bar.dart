import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{

  final String title;
  final AppBar appBar = new AppBar();
  final List<Widget> actions;

  HomeAppBar({
    Key key,
    this.title,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? ''),
      elevation: 0,
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}