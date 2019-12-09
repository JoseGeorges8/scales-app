import 'package:equatable/equatable.dart';

abstract class ScalesState extends Equatable {
  const ScalesState();
}

class InitialScalesState extends ScalesState {
  @override
  List<Object> get props => [];
}
