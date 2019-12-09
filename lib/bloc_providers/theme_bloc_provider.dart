import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scales_app/blocs/theme_bloc/bloc.dart';

class ThemeBlocProvider extends StatelessWidget{

  final Widget child;

  const ThemeBlocProvider({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: child,
  );

}