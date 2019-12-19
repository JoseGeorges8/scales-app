import 'package:equatable/equatable.dart';

abstract class SoundEvent extends Equatable {
  const SoundEvent();
}

class AppSoundChanged extends SoundEvent {

  final String sound;

  AppSoundChanged({this.sound}): assert(sound != null);

  @override
  List<Object> get props => [sound];
}