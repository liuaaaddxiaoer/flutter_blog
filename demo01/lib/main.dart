import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'mine.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
      home: DefaultTextStyle(
        style: TextStyle(
            fontSize: 20,
            decoration: TextDecoration.none,
            color: Colors.black,
//            background: Paint()..color = Colors.yellow,
        ),
        child: Home(),
      ),
//      color: Colors.cyan,
      debugShowCheckedModeBanner: false
  ));
}

class Home extends StatelessWidget {


  Widget _home(BuildContext context, int index) {
    return HomePage();
  }

  Widget _mine(BuildContext context, int index) {
    return MinePage();
  }

  Widget _vc(int index) {
    return CupertinoTabView(
        builder: (BuildContext context) {
          return index == 0 ? _home(context, index) : _mine(context, index);
        }
    );
  }

  Widget _innerWidget(context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.slow_motion_video)
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return _vc(index);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return _innerWidget(context);
  }
}