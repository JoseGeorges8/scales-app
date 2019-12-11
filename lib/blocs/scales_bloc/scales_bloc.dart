import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:scales_app/blocs/notes_bloc/bloc.dart';
import 'package:scales_app/blocs/scales_bloc/scales_repository.dart';
import 'package:scales_app/data_providers/scales_data_provider/scales_file_provider.dart';
import 'package:scales_app/models/Note.dart';
import 'package:scales_app/models/Scale.dart';
import 'bloc.dart';

class ScalesBloc extends Bloc<ScalesEvent, ScalesState> {
  final NotesBloc _notesBloc;
  StreamSubscription _notesSubscription;
  StreamSubscription _scalesSubscription;
  final ScalesRepository _scalesRepository = ScalesRepository(provider: ScalesFileProvider());

  ScalesBloc(
      {@required NotesBloc notesBloc})
      : assert(notesBloc != null),
        _notesBloc = notesBloc {


    _notesSubscription = _notesBloc.listen((state) {
      print("Listening from the ScalesBloc");
        final List<Note> selectedNotes = [];
        for(Note note in state.notes) {
          if(note.isSelected){
            print("${note.value} selected");
            selectedNotes.add(note);
          }
        }
    });
  }

  @override
  ScalesState get initialState {
    initialize();
    return ScalesLoaded(scales: List<Scale>());
  }

  initialize() {
    _scalesSubscription?.cancel();
    _scalesSubscription = _scalesRepository.scales().listen(
          (scales) => add(ScalesUpdated(scales: scales)),
        );
  }

  @override
  Stream<ScalesState> mapEventToState(
    ScalesEvent event,
  ) async* {
    if (event is ScalesUpdated) {
      yield* _mapUpdateScalesToState(event);
    }
  }

  Stream<ScalesState> _mapUpdateScalesToState(ScalesUpdated event) async* {
    yield ScalesLoaded(scales: event.scales);
  }

  @override
  Future<void> close() {
    _notesSubscription?.cancel();
    _scalesSubscription?.cancel();
    return super.close();
  }
}
