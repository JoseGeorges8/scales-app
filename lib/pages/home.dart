import 'package:flutter/material.dart';
import 'package:scales_app/pages/settings.dart';
import 'package:scales_app/utils/constants.dart';
import 'package:scales_app/widgets/draggable_scales_sheet.dart';
import 'package:scales_app/widgets/home_app_bar.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  @override
  void initState() {
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
            DraggableScalesSheet()
          ],
        ),
      ),
//      floatingActionButton: GestureDetector(
//        child: FloatingActionButton(
//          child: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: _controller),
//          elevation: 5,
//          backgroundColor: Colors.deepOrange,
//          foregroundColor: Colors.white,
//          onPressed: () async {
//            if (_controller.isDismissed)
//              _controller.forward();
//            else if (_controller.isCompleted)
//              _controller.reverse();
//          },
//        ),
      );
  }


}
