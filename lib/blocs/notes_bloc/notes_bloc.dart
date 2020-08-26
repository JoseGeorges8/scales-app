import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:scales_app/blocs/mode_bloc/bloc.dart';
import 'package:scales_app/blocs/notes_bloc/notes_repository.dart';
import 'package:scales_app/data_providers/notes_data_provider/notes_basic_provider.dart';
import 'package:scales_app/models/Note.dart';
import './bloc.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {

  final ModeBloc _modeBloc;
  StreamSubscription _modeSubscription;


  final List<String> selectedNotes = List<String>();
  final NotesRepository _notesRepository = NotesRepository(provider: NotesBasicProvider());

  NotesBloc({@required modeBloc}) :
        assert(modeBloc != null),
        _modeBloc = modeBloc,
        super(NotesState(notes: [])) {
    _modeSubscription = modeBloc.listen((mode){
    });
    this.add(UpdateAllNotes(_notesRepository.getNotes()));
  }

  @override
  NotesState get initialState {
    return NotesState(notes: _notesRepository.getNotes());
  }

  ///Checks the mode of the app and fires an event depending on de mode
  updateNote(Note note){
    if(_modeBloc.state == AppMode.isLookingForScales){
      add(UpdateNote(note));
    }
  }

  ///Fires a clear notes event
  bool clearNotes(){
    if(selectedNotes.isEmpty) return false;
    add(ClearNotes());
    return true;
  }

  @override
  Stream<NotesState> mapEventToState(
    NotesEvent event,
  ) async* {
    if(event is UpdateNote){
      yield* _mapUpdateNoteToState(event);
    }else if(event is ClearNotes){
      yield* _mapClearNotesToState(event);
    }else if(event is UpdateAllNotes){
      yield* _mapUpdateAllNotesToState(event);
    }
  }


  Stream<NotesState> _mapUpdateNoteToState(UpdateNote event) async* {

    final Note updatedNote = event.updatedNote.copyWith(isSharp: event.updatedNote.isSharp, value: event.updatedNote.value, isSelected: !event.updatedNote.isSelected, midi: event.updatedNote.midi);

    if(selectedNotes.contains(updatedNote.value)){
      selectedNotes.remove(updatedNote.value);
    }

    if(selectedNotes.length < 7){
      if(updatedNote.isSelected){
        selectedNotes.add(updatedNote.value);
      }
      final List<Note> updatedNotes = state.notes.map((note) {
        return note.value == updatedNote.value ? updatedNote : note;
      }).toList();
      yield NotesState(notes: updatedNotes);
    }else{
      final List<Note> updatedNotes = state.notes.map((note) {
        return note.value == event.updatedNote.value ? event.updatedNote : note;
      }).toList();
      yield NotesState(notes: updatedNotes);
    }

  }
  Stream<NotesState> _mapClearNotesToState(ClearNotes event) async* {
    selectedNotes.clear();
    final List<Note> updatedNotes = List<Note>();
    for(Note note in _notesRepository.getNotes()) {
      final Note updatedNote = note.copyWith(isSharp: note.isSharp, value: note.value, isSelected: false, midi: note.midi);
      updatedNotes.add(updatedNote);
    }
      yield NotesState(notes: updatedNotes);
  }

  Stream<NotesState> _mapUpdateAllNotesToState(UpdateAllNotes event) async* {
    final List<Note> updatedNotes = List<Note>();
    for(Note note in event.notes) {
      final Note updatedNote = note.copyWith(isSharp: note.isSharp, value: note.value, isSelected: note.isSelected, midi: note.midi);
      updatedNotes.add(updatedNote);
    }

    yield NotesState(notes: event.notes);
  }

  @override
  Future<void> close() {
    _modeSubscription?.cancel();
    return super.close();
  }

}



