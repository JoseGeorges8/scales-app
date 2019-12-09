import 'package:equatable/equatable.dart';
import 'package:scales_app/models/Scale.dart';

abstract class ScalesEvent extends Equatable {
  const ScalesEvent();
}

class ScalesUpdated extends ScalesEvent{

  final List<Scale> scales;

  ScalesUpdated({this.scales});

  @override
  List<Object> get props => [scales];

}


