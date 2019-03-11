import 'package:flutter/material.dart';
import 'dart:async';
import 'PageControl.dart';

class RecycleWidget extends StatefulWidget {
  var urls;

  RecycleWidget(this.urls);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RecycleState();
  }

}

class _RecycleState extends State<RecycleWidget> {

  Timer _timer;

  PageController _pageController;

  int currentIndex = 0;

  void _startTimer() {
//    _timer = Timer.periodic(Duration(seconds: 3), _callback);
  }

  void _clearTimer() {
    if (_timer == null) return;
    _timer.cancel();
    _timer = null;
  }

  @override
  void initState() {
    _startTimer();

    _pageController = PageController(
        initialPage: 1,
        viewportFraction: 1.0
    );

    _pageController.addListener(() {
//      print(1);
    });

    super.initState();
  }

  void _callback(Timer timer) {
    double page = _pageController.page;

    _pageController.animateToPage(
        page.toInt() + 1, duration: Duration(milliseconds: 400),
        curve: Curves.linear);

    setState(() {
      this.currentIndex = page.toInt();
    });
  }

  void _onPageChanged(int index) {
    if (index == 4) {
      _pageController.jumpToPage(1);
    }
    if (index == 0) {
      _pageController.jumpToPage(3);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        color: Colors.red,
        child: Stack(

          children: <Widget>[
            GestureDetector(

              onTapDown: (TapDownDetails details) {
                _clearTimer();
                print('dpwn');
              },

              onTapCancel: () {
                print('cancel');
                _clearTimer();
              },

              onTapUp: (TapUpDetails up) {
                print('up');
                _startTimer();
              },

              onPanStart: (DragStartDetails pan) {
                print('onPanStart');
              },
              onPanCancel: () {
                print('onPanCancel');
              },

              child:
              PageView
                (
                onPageChanged
                    :
                _onPageChanged,
                controller: _pageController,
                children: <Widget>[
                  Image.network(
                    'https://upload-images.jianshu.io/upload_images/5272603-efe31bb47d9b473a?imageMogr2/auto-orient/strip%7CimageView2/2/w/1000',
                    fit: BoxFit.fill,
                  ),
                  Image.network(
                    'https://cdn2.jianshu.io/assets/web/web-note-ad-1-c2e1746859dbf03abe49248893c9bea4.png',
                    fit: BoxFit.fill,
                  ),
                  Image.network(
                    'https://upload.jianshu.io/users/upload_avatars/935738/2a575dda-c26a-4116-9769-6a25b9a0a127.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/114/h/114',
                    fit: BoxFit.fill,
                  ),
                  Image.network(
                    'https://upload-images.jianshu.io/upload_images/5272603-efe31bb47d9b473a?imageMogr2/auto-orient/strip%7CimageView2/2/w/1000',
                    fit: BoxFit.fill,
                  ),
                  Image.network(
                    'https://cdn2.jianshu.io/assets/web/web-note-ad-1-c2e1746859dbf03abe49248893c9bea4.png',
                    fit: BoxFit.fill,
                  ),
                ],
              )
              ,
            )
            ,

            Align
              (
              alignment
                  :
              Alignment
                (
                  0
                  ,
                  .9
              )
              ,
              child
                  :
              UIPageControl
                (
                3
                ,
                pageIndicatorTintColor
                    :
                Colors
                    .
                white
                ,
                currentPage
                    :
                this
                    .
                currentIndex
                ,
              )
              ,
            )
          ]
          ,
        )

    );
  }

}