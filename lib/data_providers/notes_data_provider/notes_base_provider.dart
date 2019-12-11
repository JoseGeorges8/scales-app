import 'package:scales_app/models/Note.dart';

abstract class NotesBaseProvider{

  Future<List<Note>> getAsyncNotes();
  List<Note> getNotes();

  void updateNote(Note note);
}