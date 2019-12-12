import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:scales_app/blocs/notes_bloc/notes_repository.dart';
import 'package:scales_app/data_providers/notes_data_provider/notes_basic_provider.dart';
import 'package:scales_app/models/Note.dart';
import './bloc.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {

  final List<String> selectedNotes = List<String>();

  final NotesRepository _notesRepository = NotesRepository(provider: NotesBasicProvider());

  @override
  NotesState get initialState {
    return NotesState(notes: _notesRepository.getNotes());
  }

  @override
  Stream<NotesState> mapEventToState(
    NotesEvent event,
  ) async* {
    if(event is UpdateNote){
      yield* _mapUpdateNoteToState(event);
    }
  }

  Stream<NotesState> _mapUpdateNoteToState(UpdateNote event) async* {


    if(selectedNotes.contains(event.updatedNote.value)){
      selectedNotes.remove(event.updatedNote.value);
    }

    if(event.updatedNote.isSelected){
      selectedNotes.add(event.updatedNote.value);
    }

    final List<Note> updatedNotes = state.notes.map((note) {
      return note.value == event.updatedNote.value ? event.updatedNote : note;
    }).toList();
    yield NotesState(notes: updatedNotes);
  }

}
