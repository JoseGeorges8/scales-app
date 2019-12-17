import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scales_app/blocs/notes_bloc/bloc.dart';
import 'package:scales_app/blocs/sound_bloc/bloc.dart';
import 'package:scales_app/blocs/theme_bloc/bloc.dart';
import 'package:scales_app/models/Note.dart';
import 'package:scales_app/utils/constants.dart';

import 'note_button.dart';

class NotesButtonGroup extends StatelessWidget{

  final List<Note> notes;
  NotesBloc notesBloc;
  SoundBloc soundBloc;

  NotesButtonGroup({Key key, @required this.notes})
      : assert (notes != null),
       assert (notes.length == 12),
        super(key: key);

  _onNotePressed(Note note){
    notesBloc.add(UpdateNote(note));
    soundBloc.playNote(note);
  }

  @override
  Widget build(BuildContext context) {
    soundBloc = BlocProvider.of<SoundBloc>(context);
    notesBloc = BlocProvider.of<NotesBloc>(context);
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (BuildContext context, ThemeState state) => _getButtonGroup(state.value),);
  }


  _buildPianoGroup(){
    return Container(
      height: 300,
      child: ListView(
        shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: notes
              .map((note) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: PianoButton(
            note: note,
            onTap: () => _onNotePressed(note),
          ),
              ))
              .toList()),
    );
  }

  _buildPianoTilesRow(List<Note> notes){

    return Row(
      children: <Widget>[

      ],
    );
  }

  _buildDrumpadGroup(){
    return Card(
      child: GridView.count(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          crossAxisCount: 4,
          children: notes
              .map((note) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: DrumpadButton(
              note: note,
              onTap: () => _onNotePressed(note),
            ),
          ))
              .toList()),
    );
  }

  _getButtonGroup(String value) {
    switch (value){
      case PIANO_THEME_OPTION:
        return _buildPianoGroup();
        break;
      case DRUMPAD_THEME_OPTION:
        return _buildDrumpadGroup();
        break;
      default:
        return _buildPianoGroup();
        break;
    }
  }



}

