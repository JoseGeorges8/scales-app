import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scales_app/blocs/scales_bloc/bloc.dart';

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
      child: SizedBox.expand(
        child: SlideTransition(
          position: _tween.animate(_controller),
          child: DraggableScrollableSheet(
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(24)), color: Theme.of(context).accentColor),
                child: Column(
                  children: <Widget>[
                    SingleChildScrollView(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Scales found'),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        physics: ClampingScrollPhysics(),
                        controller: scrollController),
                    BlocBuilder<ScalesBloc, ScalesState>(
                        builder: (BuildContext context, ScalesState state) {


                          if(state is ScalesLoaded){
                            return Expanded(
                              child: ListView.builder(
                                physics: ClampingScrollPhysics(),
                                controller: scrollController,
                                itemCount: state.scales.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(title: Text(state.scales[index].toString()));
                                },
                              ),
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