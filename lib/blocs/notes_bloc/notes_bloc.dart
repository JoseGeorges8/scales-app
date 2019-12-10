import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  @override
  NotesState get initialState => InitialNotesState();

  @override
  Stream<NotesState> mapEventToState(
    NotesEvent event,
  ) async* {
    if(event is UpdateNote){
      yield* _mapUpdateNoteToState(event);
    }
  }

  Stream<NotesState> _mapUpdateNoteToState(UpdateNote event) async* {
    if (state is InitialNotesState) {
        //todo: update the notes here and add a state that the scales bloc can listen and react to
    }
  }

}
