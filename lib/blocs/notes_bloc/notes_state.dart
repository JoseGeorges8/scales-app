import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:scales_app/models/Note.dart';

class NotesState extends Equatable {
  final List<Note> notes;

  NotesState({@required this.notes});

  @override
  String toString() {
    return 'NotesLoaded{notes: $notes}';
  }

  @override
  List<Object> get props => [notes];
}
