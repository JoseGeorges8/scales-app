import 'package:equatable/equatable.dart';

abstract class SoundState extends Equatable {
  const SoundState();
}

class InitialSoundState extends SoundState {
  @override
  List<Object> get props => [];
}
