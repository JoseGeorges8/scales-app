import 'package:flutter/material.dart';

class  ClearButton extends StatelessWidget {

  final VoidCallback onPressed;

  const ClearButton({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.redAccent,
      onPressed: onPressed,
      child: Icon(Icons.clear)
    );
  }
}