import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'CycleWidget.dart';
import 'Test.dart';
import 'http.dart';
import 'dart:convert';
import 'ArticleModel.dart';
import 'package:demo01/article.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<ArticleModel> datas;

  initState() {
    Http().get<Map<String, dynamic>>(
        'https://liuxiaoer.club/api/blog/articleList').then((res) {
      if (res.statusCode == 200) {
        print(res.data['data'].runtimeType.toString() + 'aaa');
        setState(() {
          List<dynamic> lists = res.data['data'];
          this.datas = lists.map((obj) {
            return ArticleModel.fromJson(obj);
          }).toList();
        });
        print(this.datas);
      }
    });

    super.initState();
  }


  Widget _tagWidget() {
    return Container(
      padding: EdgeInsets.all(10),
//      color: Colors.cyan,
      child: DefaultTextStyle(
        style: TextStyle(
            color: Color(0xffea6f5a),
//            background: Paint()
//              ..color = Colors.red
        ),
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 10,
          runSpacing: 20,
          textDirection: TextDirection.ltr,
          verticalDirection: VerticalDirection.down,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            Text('标签:',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text('iOS2'),
            Text('iOS3'),
            Text('iOS4'),
            Text('iOS5'),
            Text('iOS6'),
            Text('iOS7'),
          ],
        ),
      ),
    );
  }

  Widget _sections() {
    return Container(
      child: Column(
          children: _sectionRows()
      ),
    );
  }

  List<Widget> _sectionRows() {
    if (datas == null) return [Text('')];
    return datas.map((obj) {
      return _sectionRow(obj);
    }).toList();
  }

  Widget _sectionRow(ArticleModel model) {
    try {
      return GestureDetector(
        onTap: () {
          Navigator.of(this.context, rootNavigator: true).push(
            CupertinoPageRoute(
              builder: (context) {
                return ArticlePage(model);
              },
            ),);
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Colors.grey
                  )
              )
          ),
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Expanded(
                  child:
                  Container(
//                  color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(model.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(model.article_content,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ),

              Container(
//              color: Colors.red,
                height: 80,
                constraints: BoxConstraints(
                    minWidth: 0,
                    maxWidth: 80,
                    minHeight: 0,
                    maxHeight: 80
                ),
                child: Image.network(
                  model.article_icon,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('首页'),
      ),
      child: Container(
        child: ListView(
          children: <Widget>[
            RecycleWidget('1'),
            _tagWidget(),
            _sections()
          ],
        ),
      ),
    );
  }
}