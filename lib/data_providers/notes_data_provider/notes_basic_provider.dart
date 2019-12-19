import 'package:scales_app/data_providers/notes_data_provider/notes_base_provider.dart';
import 'package:scales_app/models/Note.dart';

class NotesBasicProvider extends NotesBaseProvider{

  ///All the available notes
  final List<Note> _notes = [
    Note.C(),
    Note.dFlat(),
    Note.D(),
    Note.eFlat(),
    Note.E(),
    Note.F(),
    Note.gFlat(),
    Note.G(),
    Note.aFlat(),
    Note.A(),
    Note.bFlat(),
    Note.B(),
  ];

  @override
  List<Note> getNotes() => _notes;

  @override
  void updateNote(Note updatedNote) {
    _notes.firstWhere((note) => note.value == updatedNote.value).isSelected = updatedNote.isSelected;
  }
}