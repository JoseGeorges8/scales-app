import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scales_app/bloc_providers/scales_bloc_provider.dart';
import 'package:scales_app/blocs/notes_bloc/bloc.dart';
import 'package:scales_app/models/Note.dart';
import 'package:scales_app/pages/settings.dart';
import 'package:scales_app/utils/constants.dart';
import 'package:scales_app/widgets/draggable_scales_sheet.dart';
import 'package:scales_app/widgets/home_app_bar.dart';
import 'package:scales_app/widgets/note_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  NotesBloc _notesBloc;

  @override
  void initState() {
    _notesBloc = BlocProvider.of<NotesBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        title: HOME_TITLE,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage())))
        ],
      ),
      body: ScalesBlocProvider(
        child: BlocBuilder<NotesBloc, NotesState>(
            builder: (BuildContext context, NotesState state) {
                return SizedBox.expand(
                  child: Stack(
                    children: <Widget>[
                      _buildNoteButtonsGroup(state.notes),
                      DraggableScalesSheet()
                    ],
                  ),
                );
        }),
      ),
//      floatingActionButton: GestureDetector(
//        child: FloatingActionButton(
//          child: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: _controller),
//          elevation: 5,
//          backgroundColor: Colors.deepOrange,
//          foregroundColor: Colors.white,
//          onPressed: () async {
//            if (_controller.isDismissed)
//              _controller.forward();
//            else if (_controller.isCompleted)
//              _controller.reverse();
//          },
//        ),
    );
  }

  _buildNoteButtonsGroup(List<Note> notes) {
    return Container(
      height: 300,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: notes
              .map((note) => NoteButton(
                    note: note,
                    onTap: () {
                      final Note updatedNote = note.copyWith(isSharp: note.isSharp, value: note.value, isSelected: !note.isSelected);
                      _notesBloc.add(UpdateNote(updatedNote));
                    },
                  ))
              .toList()),
    );
  }
}
