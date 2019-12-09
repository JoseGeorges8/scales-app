import 'package:equatable/equatable.dart';

abstract class NotesState extends Equatable {
  const NotesState();
}

class InitialNotesState extends NotesState {
  @override
  List<Object> get props => [];
}
