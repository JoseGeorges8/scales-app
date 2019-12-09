import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:scales_app/blocs/notes_bloc/bloc.dart';
import 'package:scales_app/blocs/scales_bloc/scales_repository.dart';
import 'package:scales_app/models/Scale.dart';
import 'bloc.dart';

class ScalesBloc extends Bloc<ScalesEvent, ScalesState> {
  final NotesBloc _notesBloc;
  StreamSubscription _notesSubscription;
  final ScalesRepository _scalesRepository;
  StreamSubscription _scalesSubscription;

  ScalesBloc(
      {@required ScalesRepository scalesRepository,
      @required NotesBloc notesBloc})
      : assert(scalesRepository != null),
        assert(notesBloc != null),
        _notesBloc = notesBloc,
        _scalesRepository = scalesRepository {
    _notesSubscription = _notesBloc.listen((state) {
      ///React to events coming from the notes bloc e.g adding a note, removing a note, clearing all notes
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
