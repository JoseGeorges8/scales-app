import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:scales_app/models/Note.dart';

abstract class SoundBaseProvider{

  Future<void> initialize();
  Future<void> playNote(Note note);
  Future<void> changeSound(String sound);

}

class FlutterMidiSoundProvider extends SoundBaseProvider {

  @override
  // ignore: missing_return
  Future<void> initialize() {
    FlutterMidi.unmute();
    rootBundle.load("assets/sounds/synth.sf2").then((sf2) {
      FlutterMidi.prepare(sf2: sf2, name: "synth.sf2");
    });
  }

  @override
  Future<void> playNote(Note note) => FlutterMidi.playMidiNote(midi: note.midi);

  @override
  // ignore: missing_return
  Future<void> changeSound(String sound) {
    rootBundle.load("assets/sounds/Piano.sf2").then((sf2) {
      FlutterMidi.changeSound(sf2: sf2, name: "Piano.sf2");
    });
  }}