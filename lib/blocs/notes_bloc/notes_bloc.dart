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
    // TODO: Add Logic
  }
}
