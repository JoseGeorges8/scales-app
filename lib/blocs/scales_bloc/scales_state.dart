import 'package:equatable/equatable.dart';
import 'package:scales_app/models/Scale.dart';

abstract class ScalesState extends Equatable {
  const ScalesState();
}

class ScalesLoaded extends ScalesState {

  final List<Scale> scales;

  ScalesLoaded({this.scales});

  @override
  List<Object> get props => [scales];

}
