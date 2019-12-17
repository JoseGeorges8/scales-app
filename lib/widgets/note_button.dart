import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scales_app/models/Note.dart';

class PianoButton extends StatelessWidget{

  final Note note;
  final GestureTapCallback onTap;

  const PianoButton({Key key, this.note, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 4,
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(alignment: Alignment.bottomLeft,child: Text(note.value, style: TextStyle(color: note.isSharp ? Colors.white : Colors.black),)),
      ),
      color: note.isSharp ? note.isSelected ? Colors.black.withOpacity(.5) : Colors.black : note.isSelected ? Colors.white.withOpacity(.5) : Colors.white,
    );
  }

}

class DrumpadButton extends StatelessWidget{
  final Note note;
  final GestureTapCallback onTap;

  const DrumpadButton({Key key, this.note, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Center(child: Text(note.value)),
      onPressed: onTap,
      color: note.isSelected ? Theme.of(context).cardTheme.color :  Theme.of(context).accentColor,
    );
  }

}