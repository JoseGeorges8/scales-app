import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scales_app/bloc_providers/notes_bloc_provider.dart';
import 'package:scales_app/blocs/mode_bloc/bloc.dart';
import 'package:scales_app/blocs/theme_bloc/bloc.dart';
import 'package:scales_app/pages/home.dart';
import 'package:bloc/bloc.dart';
import 'blocs/sound_bloc/sound_bloc.dart';
import 'pages/home.dart';


void main() {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider<SoundBloc>(
          create: (context) => SoundBloc(),
        ),
        BlocProvider<ModeBloc>(
          create: (context) => ModeBloc(),
        ),
      ],
      child: App())
  );
}

class App extends StatelessWidget {

  App({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return MaterialApp(
          title: 'Scale Up',
          theme: themeState.theme,

          home: NotesBlocProvider(child: HomePage()),
        );
      },
    );
  }
}