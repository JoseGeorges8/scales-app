import 'package:equatable/equatable.dart';
import 'package:scales_app/models/Note.dart';

abstract class NotesEvent extends Equatable {
  const NotesEvent();
}


class UpdateNote extends NotesEvent {
  final Note updatedNote;

  const UpdateNote(this.updatedNote);

  @override
  List<Object> get props => [updatedNote];

  @override
  String toString() => 'UpdateNote { updatedNote: $updatedNote }';
}
