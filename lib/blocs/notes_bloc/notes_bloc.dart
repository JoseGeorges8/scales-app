import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:scales_app/blocs/notes_bloc/notes_repository.dart';
import 'package:scales_app/data_providers/notes_data_provider/notes_basic_provider.dart';
import './bloc.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {

  final NotesRepository _notesRepository = NotesRepository(provider: NotesBasicProvider());

  @override
  NotesState get initialState => NotesState(notes: _notesRepository.getNotes());

  @override
  Stream<NotesState> mapEventToState(
    NotesEvent event,
  ) async* {
    if(event is UpdateNote){
      yield* _mapUpdateNoteToState(event);
    }
  }

  Stream<NotesState> _mapUpdateNoteToState(UpdateNote event) async* {
    _notesRepository.updateNote(note: event.updatedNote);
    yield NotesState(notes: _notesRepository.getNotes());
  }

}
