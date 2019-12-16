import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scales_app/blocs/notes_bloc/bloc.dart';
import 'package:scales_app/blocs/theme_bloc/bloc.dart';
import 'package:scales_app/models/Note.dart';
import 'package:scales_app/utils/constants.dart';

import 'note_button.dart';

class NotesButtonGroup extends StatelessWidget{

  final List<Note> notes;
  final NotesBloc notesBloc;

  const NotesButtonGroup({Key key, @required this.notes, this.notesBloc})
      : assert (notes.length == 12),
        super(key: key);

  @override
  Widget build(BuildContext context) {

    _buildPianoGroup(){
      return Container(
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: notes
                .map((note) => PianoButton(
              note: note,
              onTap: () {
                final Note updatedNote = note.copyWith(isSharp: note.isSharp, value: note.value, isSelected: !note.isSelected);
                notesBloc.add(UpdateNote(updatedNote));
              },
            ))
                .toList()),
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
                onTap: () {
                  final Note updatedNote = note.copyWith(isSharp: note.isSharp, value: note.value, isSelected: !note.isSelected);
                  notesBloc.add(UpdateNote(updatedNote));
                },
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


    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (BuildContext context, ThemeState state)=> _getButtonGroup(state.value),
    );
  }
}

