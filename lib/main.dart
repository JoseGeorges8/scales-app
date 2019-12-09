import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scales_app/bloc_providers/theme_bloc_provider.dart';
import 'package:scales_app/blocs/theme_bloc/bloc.dart';
import 'package:scales_app/pages/home.dart';
import 'package:bloc/bloc.dart';

import 'bloc_providers/scales_bloc_provider.dart';
import 'pages/home.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(ThemeBlocProvider(child: App())
  );
}

class App extends StatelessWidget {

  App({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {

//        if(themeState.isLoading){
//          return MaterialApp(
//            title: 'Scale Up',
//            theme: themeState.theme,
//            home: Scaffold(body: Center(child: CircularProgressIndicator(),),),
//          );
//        }

        return MaterialApp(
          title: 'Scale Up',
          theme: themeState.theme,
          home: ScalesBlocProvider(child: HomePage()),
        );
      },
    );
  }
}