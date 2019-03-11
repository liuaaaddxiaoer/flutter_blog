import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui' as UI;

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {


  Widget _headerWidget() {
    return Stack(
      children: <Widget>[
        Container(
          height: 200,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://www.liuxiaoer.club/statics/articleIcon/657c7adbec3152edf3017a3b96cd10e1.png'),
                  fit: BoxFit.cover
              )
          ),
        ),
        BackdropFilter(
          filter: UI.ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            height: 200,
            color: Colors.white.withOpacity(.1),
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 65 / 2,
                    backgroundImage: NetworkImage(
                        'https://upload-images.jianshu.io/upload_images/1767348-83a69d3285abca99.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/217')
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _sectionGray() {
    return Container(
      height: 10,
    );
  }

  Widget _sectionName() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _rowWithName('刘小二'),
          _rowWithName('iOS开发, Vue, 小程序'),
        ],
      ),
    );
  }

  Widget _section2Name() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _rowWithName('中公教育(北京总部)'),
          _rowWithName('oneenddi@163.com'),
          _rowWithName('https://www.liuxiaoer.club'),
          _rowWithName('https://github.com/liuaaaddxiaoer'),
        ],
      ),
    );
  }



  Widget _rowWithName([String name]) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          Icon(Icons.home),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(name ?? '刘小二'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('我的'),
      ),
      child: SafeArea(
        left: true,
        right: true,
        child: Container(
            color: Colors.grey.withAlpha(60),
            child: DefaultTextStyle(
              style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.none,
                  color: Colors.black
              ),
              child: ListView(
                children: <Widget>[
                  _headerWidget(),
                  _sectionGray(),
                  _sectionName(),
                  _sectionGray(),
                  _section2Name(),
                ],
              ),
            )
        ),
      ),
    );
  }
}