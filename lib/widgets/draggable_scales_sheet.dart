import 'package:flutter/material.dart';

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
    return SizedBox.expand(
      child: SlideTransition(
        position: _tween.animate(_controller),
        child: DraggableScrollableSheet(
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color:Colors.blue[100]),
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
                  Expanded(
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      controller: scrollController,
                      itemCount: 25,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(title: Text('Item $index'));
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

}