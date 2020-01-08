import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scales_app/models/Note.dart';

class PianoButton extends StatelessWidget {
  final Note note;
  final GestureTapCallback onTap;

  const PianoButton({Key key, this.note, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 20,
      height: 60,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8.0),
            side: note.isSelected
                ? BorderSide(color: Theme.of(context).accentColor)
                : BorderSide(color: Colors.transparent)),
        elevation: note.isSelected ? 0 : 4,
        onPressed: note.isDisabled ? null : onTap,
        child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              note.value,
              style:
                  TextStyle(color: note.isSharp ? Colors.white : Colors.black),
            )),
        color: note.isSharp
            ? note.isSelected ? Colors.black.withOpacity(.5) : Colors.black
            : Colors.white,
      ),
    );
  }
}

class DrumpadButton extends StatelessWidget {
  final Note note;
  final GestureTapCallback onTap;

  const DrumpadButton({Key key, this.note, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        RaisedButton(
          color: Theme.of(context).backgroundColor,
          child: Center(child: Text(note.value, style: TextStyle(color: Theme.of(context).primaryColor))),
          onPressed: note.isDisabled ? null : onTap,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
                width: 12.0,
                height: 12.0,
                decoration: BoxDecoration(
                  color: note.isSelected ? Colors.green : Colors.redAccent,
                  shape: BoxShape.circle,
                )),
          ),
        ),
      ],
    );
  }
}
