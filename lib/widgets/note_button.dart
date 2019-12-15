import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scales_app/models/Note.dart';
import 'package:scales_app/utils/constants.dart';

///Represents one pressable note. It holds a note model
class NoteButton extends StatelessWidget{

  final Note note;
  final String theme;
  final GestureTapCallback onTap;

  const NoteButton({Key key, @required this.note, @required this.onTap, this.theme = PIANO_THEME_OPTION}) : super(key: key);

  @override
  Widget build(BuildContext context) => _getNoteButtonWidget(theme);

  Widget _getNoteButtonWidget(String value){
    switch (value){
      case PIANO_THEME_OPTION:
        return _buildPianoButton();
        break;
      case DRUMPAD_THEME_OPTION:
        return _buildDrumpadButton();
        break;
      default:
        return _buildPianoButton();
        break;
    }
  }

  Widget _buildPianoButton(){
    return RaisedButton(
      onPressed: onTap,
      color: note.isSharp ? note.isSelected ? Colors.black.withOpacity(.5) : Colors.black : note.isSelected ? Colors.white.withOpacity(.5) : Colors.white,
    );
  }

  Widget _buildDrumpadButton(){
    return RaisedButton(
      onPressed: onTap,
      color: note.isSharp ? note.isSelected ? Colors.black.withOpacity(.5) : Colors.black : note.isSelected ? Colors.white.withOpacity(.5) : Colors.white,
    );
  }

}