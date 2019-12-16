import 'package:scales_app/models/Note.dart';

abstract class NotesBaseProvider{

  List<Note> getNotes();

  void updateNote(Note note);
}