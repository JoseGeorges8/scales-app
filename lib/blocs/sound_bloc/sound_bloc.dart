import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:scales_app/data_providers/sound_provider.dart';
import 'package:scales_app/models/Note.dart';
import './bloc.dart';

class SoundBloc extends Bloc<SoundEvent, SoundState> {

  final FlutterMidiSoundProvider soundProvider = FlutterMidiSoundProvider();

  _initialize() => soundProvider.initialize();
  @override
  SoundState get initialState {
    _initialize();
    return InitialSoundState();
  }

  playNote(Note note) => soundProvider.playNote(note);
  changeSound(String sound) => soundProvider.changeSound(sound);

  @override
  Stream<SoundState> mapEventToState(
    SoundEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
