import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:scales_app/data_providers/sound_provider.dart';
import 'package:scales_app/models/Note.dart';
import './bloc.dart';

class SoundBloc extends Bloc<SoundEvent, SoundState> {

  List<String> sounds = List<String>();
  String currentSound;

  final FlutterMidiSoundProvider soundProvider = FlutterMidiSoundProvider();

  _initialize() async {
    sounds = soundProvider.getSounds();
    currentSound = await soundProvider.getCurrentSound();
    await soundProvider.initialize();
  }
  @override
  SoundState get initialState {
    _initialize();
    return SoundState.initial();
  }

  playNote(Note note) => soundProvider.playNote(note);

  @override
  Stream<SoundState> mapEventToState(
    SoundEvent event,
  ) async* {
    if (event is AppSoundChanged){
      currentSound = event.sound;
      soundProvider.changeSound(event.sound);
      yield SoundState(value: currentSound);
    }
  }
}
