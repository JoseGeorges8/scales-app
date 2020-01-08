import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import './bloc.dart';


/// Mode defines whether we are in freestyle mode or search scales mode
/// Freestyle mode - Play notes as you please
/// Search Scales mode - Playing notes will search for scales that contain those notes
/// False means we are in freestyle mode.
/// Made it a boolean because there is only two modes always
class ModeBloc extends Bloc<bool, bool> {

  @override
  bool get initialState => false;

  toggleMode() => add(!state);

  @override
  Stream<bool> mapEventToState(
    bool event,
  ) async* {
    print(event);
    yield event;
  }
}
