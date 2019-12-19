import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:scales_app/utils/constants.dart';

class SoundState extends Equatable {
  final String value;

  const SoundState({@required this.value});

  factory SoundState.initial() => SoundState(value: PIANO_SOUND_OPTION);
  factory SoundState.piano() => SoundState(value: PIANO_SOUND_OPTION);
  factory SoundState.drumpad() => SoundState(value: SYNTH_SOUND_OPTION);

  @override
  List<Object> get props => [value];
}




