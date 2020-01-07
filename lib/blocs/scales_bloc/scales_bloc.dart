import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:scales_app/blocs/notes_bloc/bloc.dart';
import 'package:scales_app/blocs/scales_bloc/scales_repository.dart';
import 'package:scales_app/data_providers/scales_data_provider/scales_basic_provider.dart';
import 'package:scales_app/models/Scale.dart';
import 'bloc.dart';

class ScalesBloc extends Bloc<ScalesEvent, ScalesState> {
  final NotesBloc _notesBloc;
  StreamSubscription _notesSubscription;
  final ScalesRepository _scalesRepository = ScalesRepository(provider: ScalesBasicProvider());

  ScalesBloc(
      {@required NotesBloc notesBloc})
      : assert(notesBloc != null),
        _notesBloc = notesBloc {

    _notesSubscription = _notesBloc.listen((state) {
      add(ScalesUpdated(scales: _scalesRepository.getScales(selectedNotes: _notesBloc.selectedNotes)));
    });
  }

  selectScale(Scale scale) => _notesBloc.add(UpdateAllNotes(scale.playableNotes));

  @override
  ScalesState get initialState => ScalesLoaded(scales: List<Scale>());

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
    return super.close();
  }
}
