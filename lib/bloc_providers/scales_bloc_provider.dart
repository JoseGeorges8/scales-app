import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scales_app/blocs/notes_bloc/bloc.dart';
import 'package:scales_app/blocs/scales_bloc/scales_cubit.dart';

class ScalesBlocProvider extends StatelessWidget{

  final Widget child;

  const ScalesBlocProvider({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScalesCubit>(
    create: (context) => ScalesCubit(notesBloc: BlocProvider.of<NotesBloc>(context)),
    child: child,
  );
  }

}