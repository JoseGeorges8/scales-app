import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_midi/flutter_midi.dart';
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

  NotesButtonGroup({Key key, @required this.notes, this.notesBloc})
      : assert (notes != null),
       assert (notes.length == 12),
       assert (notesBloc != null),
        super(key: key);


  @override
  Widget build(BuildContext context) {
    soundBloc = BlocProvider.of<SoundBloc>(context);

    _buildPianoGroup(){
      return Container(
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: notes
                .map((note) => PianoButton(
              note: note,
              onTap: () => _onNotePressed(note),
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


    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (BuildContext context, ThemeState state)=> _getButtonGroup(state.value),
    );
  }

  _onNotePressed(Note note){
    final Note updatedNote = note.copyWith(isSharp: note.isSharp, value: note.value, isSelected: !note.isSelected, midi: note.midi);
    notesBloc.add(UpdateNote(updatedNote));
    soundBloc.playNote(note);
  }

}

