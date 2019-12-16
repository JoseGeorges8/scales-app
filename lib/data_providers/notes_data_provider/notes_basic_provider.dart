import 'package:scales_app/data_providers/notes_data_provider/notes_base_provider.dart';
import 'package:scales_app/models/Note.dart';

class NotesBasicProvider extends NotesBaseProvider{

  ///All the available notes
  final List<Note> _notes = [
    Note(value: 'C', isSelected: false, isSharp: false),
    Note(value: 'D♭', isSelected: false, isSharp: true),
    Note(value: 'D', isSelected: false, isSharp: false),
    Note(value: 'E♭', isSelected: false, isSharp: true),
    Note(value: 'E', isSelected: false, isSharp: false),
    Note(value: 'F', isSelected: false, isSharp: false),
    Note(value: 'G♭', isSelected: false, isSharp: true),
    Note(value: 'G', isSelected: false, isSharp: false),
    Note(value: 'A♭', isSelected: false, isSharp: true),
    Note(value: 'A', isSelected: false, isSharp: false),
    Note(value: 'B♭', isSelected: false, isSharp: true),
    Note(value: 'B', isSelected: false, isSharp: false),
  ];

  @override
  List<Note> getNotes() => _notes;

  @override
  Future<List<Note>> getAsyncNotes() async => _notes;

  @override
  void updateNote(Note updatedNote) {
    _notes.firstWhere((note) => note.value == updatedNote.value).isSelected = updatedNote.isSelected;
  }
}