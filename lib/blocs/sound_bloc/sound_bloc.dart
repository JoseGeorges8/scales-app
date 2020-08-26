import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:scales_app/data_providers/sound_provider.dart';
import 'package:scales_app/models/Note.dart';
import 'package:scales_app/models/Scale.dart';
import './bloc.dart';

class SoundBloc extends Bloc<SoundEvent, SoundState> {

  List<String> sounds = List<String>();
  String currentSound;

  Note _lastPlayedNote;
  bool _soundStopped = false;

  final FlutterMidiSoundProvider soundProvider = FlutterMidiSoundProvider();

  SoundBloc([SoundState initialState]) : super(SoundState.initial()){
    _initialize();
  }

  _initialize() async {
    sounds = soundProvider.getSounds();
    currentSound = await soundProvider.getCurrentSound();
    await soundProvider.initialize();
  }

  playNote(Note note) {
    this.stopNote();
    soundProvider.playNote(note);
    _lastPlayedNote = note;
  }

  stopNote() {
    if(_lastPlayedNote != null){
      soundProvider.stopNote(_lastPlayedNote);
      _soundStopped = true;
      _lastPlayedNote = null;
    }
  }

  playRandomNotes() {
    this.stopNote();
    soundProvider.playNote(Note.B());
    soundProvider.playNote(Note.dFlat());
    soundProvider.playNote(Note.gFlat());
    soundProvider.playNote(Note.A());
  }

  playScale(Scale scale) async {
    this.stopNote();
    await Future.delayed(new Duration(milliseconds: 500));
    for(Note note in scale.playableNotes){
      print('playing $note');
      if(_soundStopped) return;
      soundProvider.playNote(note);
      await Future.delayed(new Duration(milliseconds: 500));
    }
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
