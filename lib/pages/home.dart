import 'package:flutter/material.dart';
import 'package:scales_app/pages/settings.dart';
import 'package:scales_app/utils/constants.dart';
import 'package:scales_app/widgets/home_app_bar.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  AnimationController _controller;

  Duration _duration = Duration(milliseconds: 500);

  Tween<Offset> _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));

  List<String> someList = [];

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: _duration);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        title: HOME_TITLE,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage())))
        ],
      ),
      body: SizedBox.expand(
        child: Stack(
          children: <Widget>[
            Center(child: Text('home page')),
            SizedBox.expand(
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
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        child: FloatingActionButton(
          child: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: _controller),
          elevation: 5,
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          onPressed: () async {
            if (_controller.isDismissed)
              _controller.forward();
            else if (_controller.isCompleted)
              _controller.reverse();
          },
        ),
      ),
    );
  }
}
