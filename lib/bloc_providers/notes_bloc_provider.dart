import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scales_app/blocs/mode_bloc/bloc.dart';
import 'package:scales_app/blocs/notes_bloc/bloc.dart';

class NotesBlocProvider extends StatelessWidget{

  final Widget child;

  const NotesBlocProvider({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotesBloc>(
      create: (context) => NotesBloc(modeBloc: BlocProvider.of<ModeBloc>(context)),
      child: child,
    );
  }

}