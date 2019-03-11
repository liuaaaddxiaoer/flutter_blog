import 'package:flutter/material.dart';

class UIPageControl extends StatefulWidget {

  final int numberOfPages;
  final int currentPage;
  final Color pageIndicatorTintColor;
  final Color currentPageIndicatorTintColor;

  UIPageControl(@required this.numberOfPages, {
    this.currentPage = 0,
    this.pageIndicatorTintColor = Colors.white,
    this.currentPageIndicatorTintColor = Colors.grey
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UIPageControlState();
  }

}


class _UIPageControlState extends State<UIPageControl> {

  List<Widget> _childs() {
    List<Widget> childs = List<Widget>();
    for(int i = 0; i < widget.numberOfPages; i ++) {
      var child = Container(
        width: 10,
        height: 10,
        margin: EdgeInsets.only(right: (i != widget.numberOfPages - 1 ? 8 : 0)),
        decoration: BoxDecoration(
          color: i != widget.currentPage ? widget.pageIndicatorTintColor : widget.currentPageIndicatorTintColor,
          shape: BoxShape.circle
        ),
      );
      childs.add(child);
    }
    return childs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: _childs(),
      ),
    );
  }

}