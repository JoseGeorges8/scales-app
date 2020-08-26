
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scales_app/blocs/notes_bloc/bloc.dart';
import 'package:scales_app/blocs/scales_cubit/scales_repository.dart';
import 'package:scales_app/data_providers/scales_data_provider/scales_basic_provider.dart';
import 'package:scales_app/models/Scale.dart';


class ScalesCubit extends Cubit<List<Scale>> {

  final NotesBloc _notesBloc;
  StreamSubscription _notesSubscription;
  final ScalesRepository _scalesRepository = ScalesRepository(provider: ScalesBasicProvider());


  ScalesCubit({@required NotesBloc notesBloc})
      : assert(notesBloc != null),
        this._notesBloc = notesBloc,
        super([]){
    _notesSubscription = _notesBloc.listen((state) {
      getScales(selectedNotes: _notesBloc.selectedNotes);
    });
  }

  getScales({List<String> selectedNotes}) =>  emit(_scalesRepository.getScales(selectedNotes: selectedNotes));
  selectScale(Scale scale) {
    final Scale updatedScale = Scale.copyWith(root: scale.root, type: scale.type, notes: scale.notes, playableNotes: scale.playableNotes, isSelected: scale.isSelected);
    state.forEach((element) { element.isSelected = false;});
    state[state.indexOf(state.firstWhere((value) => value.notes == scale.notes, orElse: () => null))] =  updatedScale;
    emit(state);
    _notesBloc.add(UpdateAllNotes(scale.playableNotes));
  }

  @override
  Future<void> close() {
    _notesSubscription?.cancel();
    return super.close();
  }
}
