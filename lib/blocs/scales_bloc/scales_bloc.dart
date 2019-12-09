import 'dart:async';
import 'package:bloc/bloc.dart';
import 'bloc.dart';

class ScalesBloc extends Bloc<ScalesEvent, ScalesState> {
  @override
  ScalesState get initialState => InitialScalesState();

  @override
  Stream<ScalesState> mapEventToState(
    ScalesEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
