import 'package:scales_app/data_providers/notes_data_provider/notes_base_provider.dart';
import 'package:scales_app/models/Note.dart';

class NotesBasicProvider extends NotesBaseProvider{

  ///All the available notes
  final List<Note> _notes = [
    Note(value: 'C', isSelected: false, isSharp: false, midi: 60),
    Note(value: 'D♭', isSelected: false, isSharp: true, midi: 61),
    Note(value: 'D', isSelected: false, isSharp: false, midi: 62),
    Note(value: 'E♭', isSelected: false, isSharp: true, midi: 63),
    Note(value: 'E', isSelected: false, isSharp: false, midi: 64),
    Note(value: 'F', isSelected: false, isSharp: false, midi: 65),
    Note(value: 'G♭', isSelected: false, isSharp: true, midi: 66),
    Note(value: 'G', isSelected: false, isSharp: false, midi: 67),
    Note(value: 'A♭', isSelected: false, isSharp: true, midi: 68),
    Note(value: 'A', isSelected: false, isSharp: false, midi: 69),
    Note(value: 'B♭', isSelected: false, isSharp: true, midi: 70),
    Note(value: 'B', isSelected: false, isSharp: false, midi: 71),
  ];

  @override
  List<Note> getNotes() => _notes;

  @override
  void updateNote(Note updatedNote) {
    _notes.firstWhere((note) => note.value == updatedNote.value).isSelected = updatedNote.isSelected;
  }
}