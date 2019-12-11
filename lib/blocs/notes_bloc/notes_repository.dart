import 'package:flutter/foundation.dart';
import 'package:scales_app/data_providers/notes_data_provider/notes_base_provider.dart';
import 'package:scales_app/models/Note.dart';

class NotesRepository{

  final NotesBaseProvider provider;

  NotesRepository({@required this.provider});

  List<Note> getNotes() => provider.getNotes();
  Future<List<Note>> getAsyncNotes() => provider.getAsyncNotes();
  void updateNote({Note note}) => provider.updateNote(note);

}