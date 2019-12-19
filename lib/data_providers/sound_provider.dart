import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:scales_app/models/Note.dart';
import 'package:scales_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SoundBaseProvider{

  Future<void> initialize();
  Future<void> playNote(Note note);
  Future<void> changeSound(String sound);
  List<String> getSounds();
  Future<String> getCurrentSound();

}

class FlutterMidiSoundProvider extends SoundBaseProvider {

  @override
  // ignore: missing_return
  Future<void> initialize() async {

    // Get the currently set sound
    final currentSound  = await getCurrentSound();

    // Initialize the midi player. If the sound key was null (first time opened or never changed before) then default to the piano sound
    FlutterMidi.unmute();
    rootBundle.load("assets/sounds/${currentSound ?? PIANO_SOUND_OPTION}.sf2").then((sf2) {
      FlutterMidi.prepare(sf2: sf2, name: "${currentSound ?? PIANO_SOUND_OPTION}.sf2");
    });
  }

  @override
  Future<void> playNote(Note note) => FlutterMidi.playMidiNote(midi: note.midi);

  @override
  // ignore: missing_return
  Future<void> changeSound(String sound) async {
    // Set the sound
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(SOUND_KEY, sound);
    // Prepare the midi player. If the sound key was null (first time opened or never changed before) then default to the piano sound
    rootBundle.load("assets/sounds/${sound ?? PIANO_SOUND_OPTION}.sf2").then((sf2) {
      FlutterMidi.changeSound(sf2: sf2, name: "${sound ?? PIANO_SOUND_OPTION}.sf2");
    });
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

}