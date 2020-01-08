import 'package:equatable/equatable.dart';
import 'package:scales_app/models/Note.dart';

abstract class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object> get props => [];
}


class UpdateNote extends NotesEvent {
  final Note updatedNote;

  const UpdateNote(this.updatedNote);

  @override
  List<Object> get props => [updatedNote];

  @override
  String toString() => 'UpdateNote { updatedNote: $updatedNote }';
}


class UpdateAllNotes extends NotesEvent {
  final List<Note> notes;

  const UpdateAllNotes(this.notes);

  @override
  List<Object> get props => [notes];

  @override
  String toString() => 'UpdateAllNotes { notes: $notes }';
}


class ClearNotes extends NotesEvent {

  @override
  List<Object> get props => [];

  @override
  String toString() => 'ClearNotes';
}
