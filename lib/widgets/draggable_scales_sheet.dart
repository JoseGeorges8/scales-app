import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scales_app/blocs/scales_bloc/bloc.dart';
import 'package:scales_app/blocs/sound_bloc/bloc.dart';
import 'package:scales_app/models/Scale.dart';
import 'package:scales_app/widgets/texts.dart';

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
                            child: GridView.count(
                                controller: scrollController,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                crossAxisCount: 4,
                                children: state.scales
                                    .map((scale) => Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: ScaleButton(scale: scale),
                                )).toList()),
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


class ScaleButton extends StatelessWidget{

  final Scale scale;

  const ScaleButton({Key key, this.scale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).backgroundColor,
      child: Center(child: Text(scale.root + " " + scale.type, style: TextStyle(color: Theme.of(context).primaryColor))),
      onPressed: () => BlocProvider.of<SoundBloc>(context).playScale(scale),
    );
  }

}