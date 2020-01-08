import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:scales_app/data_providers/sound_provider.dart';
import 'package:scales_app/models/Note.dart';
import 'package:scales_app/models/Scale.dart';
import './bloc.dart';

class SoundBloc extends Bloc<SoundEvent, SoundState> {

  List<String> sounds = List<String>();
  String currentSound;

  bool _soundStopped = false;

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

  playNote(Note note) {
    this.stopSound();
    return soundProvider.playNote(note);
  }

  //todo: will work on this later
  stopSound({bool fully = true}) {
//    _soundStopped = true;
//    soundProvider.stopSound(fully);
  }

  playRandomNotes() {
    this.stopSound();
    soundProvider.playNote(Note.B());
    soundProvider.playNote(Note.dFlat());
    soundProvider.playNote(Note.gFlat());
    soundProvider.playNote(Note.A());
  }

  //todo: will work on this later
  playScale(Scale scale) async {
//    this.stopSound();
//    await Future.delayed(new Duration(milliseconds: 500));
//    _soundStopped = false;
//    for(Note note in scale.playableNotes){
//      if(_soundStopped) return;
//      soundProvider.playNote(note);
//      await Future.delayed(new Duration(milliseconds: 500));
//    }
  }

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
