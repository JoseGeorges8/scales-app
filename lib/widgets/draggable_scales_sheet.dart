import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scales_app/blocs/mode_bloc/bloc.dart';
import 'package:scales_app/blocs/scales_bloc/bloc.dart';
import 'package:scales_app/blocs/sound_bloc/bloc.dart';
import 'package:scales_app/models/Scale.dart';

/// This widget displays all the found scales
class DraggableScalesSheet extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => DraggableScalesSheetState();

}

class DraggableScalesSheetState extends State<DraggableScalesSheet> with SingleTickerProviderStateMixin{

  Duration _duration = Duration(milliseconds: 500);
  Tween<Offset> _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: _duration);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ScalesBloc, ScalesState>(
      listener: (context, state) {
        if(state is ScalesLoaded){
          if(state.scales.isNotEmpty) _controller.forward();
          else if (state.scales.isEmpty) _controller.reverse();
        }
      },
      child: SlideTransition(
        position: _tween.animate(_controller),
        child: DraggableScrollableSheet(
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(24)), color: Theme.of(context).primaryColor),
              child: Column(
                children: <Widget>[
                  SingleChildScrollView(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('Scales Found', style: Theme.of(context).textTheme.display1),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      physics: ClampingScrollPhysics(),
                      controller: scrollController
                  ),
                  BlocBuilder<ScalesBloc, ScalesState>(
                      builder: (BuildContext context, ScalesState state) {


                        if(state is ScalesLoaded){

                          return Expanded(
                          child: ListView.builder(
                              itemCount: state.scales.length,
                              itemBuilder: (BuildContext context, int index){
                                final Scale scale = state.scales[index];
                                return ScaleButton(scale: scale);
                              }),
                          );

                        }

                        return Container();

                    }
                  ),
                ],
              ),
            );
          },
        ),
      )
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

}

///This widget represents one scale
class ScaleButton extends StatelessWidget{

  final Scale scale;

  const ScaleButton({Key key, this.scale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(scale.root + " " + scale.type, style: TextStyle(color: Theme.of(context).backgroundColor)),
      onTap: () {
        BlocProvider.of<ModeBloc>(context).changeMode(mode: AppMode.isScaleSelected);
        BlocProvider.of<ScalesBloc>(context).selectScale(scale);
      },
      trailing: IconButton(
        icon: Icon(Icons.play_circle_outline),
        color: Theme.of(context).backgroundColor,
        onPressed: () => BlocProvider.of<SoundBloc>(context).playScale(scale)
      ),
    );
  }

}