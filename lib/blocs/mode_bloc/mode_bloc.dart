import 'dart:async';
import 'package:bloc/bloc.dart';
import 'bloc.dart';

/// Mode defines whether we are in freestyle mode or search scales mode
/// Freestyle mode - Play notes as you please
/// Search Scales mode - Playing notes will search for scales that contain those notes
/// False means we are in freestyle mode.
/// Made it a boolean because there is only two modes always
class ModeBloc extends Bloc<AppMode, AppMode> {

  ModeBloc([AppMode initialState]) : super(AppMode.isLookingForScales);

  changeMode({AppMode mode}) => add(mode);

  @override
  Stream<AppMode> mapEventToState(
      AppMode mode,
  ) async* {
    print('changing mode to... $mode');
    yield mode;
  }
}
