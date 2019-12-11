import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scales_app/models/Note.dart';

///Represents one pressable note. It holds a note model
class NoteButton extends StatelessWidget{

  final Note note;
  final GestureTapCallback onTap;

  const NoteButton({Key key, @required this.note, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onTap,
      color: note.isSharp ? note.isSelected ? Colors.black.withOpacity(.5) : Colors.black : note.isSelected ? Colors.white.withOpacity(.5) : Colors.white,
    );
  }

}