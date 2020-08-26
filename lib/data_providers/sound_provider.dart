import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';
//import 'package:flutter_midi/flutter_midi.dart';
import 'package:scales_app/models/Note.dart';
import 'package:scales_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SoundBaseProvider{

  Future<void> initialize();
  Future<void> playNote(Note note);
  Future<void> stopNote(Note note);
  Future<void> changeSound(String sound);
  List<String> getSounds();
  Future<String> getCurrentSound();

}

class FlutterMidiSoundProvider extends SoundBaseProvider {

  static final FlutterMidiSoundProvider _singleton = FlutterMidiSoundProvider._internal();

  FlutterMidi _midiCtrl;

  factory FlutterMidiSoundProvider() {
    return _singleton;
  }

  FlutterMidiSoundProvider._internal(){
    _midiCtrl = FlutterMidi();
  }

  @override
  // ignore: missing_return
  Future<void> initialize() async {

    // Get the currently set sound
    final currentSound  = await getCurrentSound();

    // Initialize the midi player. If the sound key was null (first time opened or never changed before) then default to the piano sound
    _midiCtrl.unmute();
    rootBundle.load("assets/sounds/${currentSound ?? PIANO_SOUND_OPTION}.sf2").then((sf2) {
      _midiCtrl.prepare(sf2: sf2, name: "${currentSound ?? PIANO_SOUND_OPTION}.sf2");
    });
  }

  @override
  Future<void> playNote(Note note) => _midiCtrl.playMidiNote(midi: note.midi);

  @override
  Future<void> changeSound(String sound) async {
    final sf2 = await rootBundle.load("assets/sounds/${sound ?? PIANO_SOUND_OPTION}.sf2");
    _midiCtrl.changeSound(sf2: sf2, name: "${sound ?? PIANO_SOUND_OPTION}.sf2");

    // Set the sound
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(SOUND_KEY, sound);
  }

  @override
  List<String> getSounds() => [PIANO_SOUND_OPTION];

  @override
  Future<String> getCurrentSound() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String sound = sharedPreferences.getString(SOUND_KEY);
    if (sound == null) sharedPreferences.setString(SOUND_KEY, PIANO_SOUND_OPTION);
    return sound ?? PIANO_SOUND_OPTION;
  }

  @override
  Future<void> stopNote(Note note) => _midiCtrl.stopMidiNote(midi: note.midi);

}