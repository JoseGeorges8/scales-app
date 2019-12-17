
import 'package:flutter/material.dart';

/// This class contains all the custom text widgets

class ListHeadingText extends StatelessWidget{

  final String text;

  const ListHeadingText(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
    child: Text(text, style: Theme.of(context).textTheme.display2),
  );
}