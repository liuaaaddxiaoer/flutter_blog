import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:demo01/ArticleModel.dart';
import 'package:demo01/webview.dart';

class ArticlePage extends StatefulWidget {
  ArticleModel articleModel;

  ArticlePage(@required this.articleModel);

  @override
  _ArticlePageState createState() => new _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: MediaQuery
                    .of(context)
                    .size
                    .height
            ),
            child: markdown,
          ),
        ),
      ),
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.articleModel.title ?? '文章详情'),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        automaticallyImplyLeading: false,
        automaticallyImplyMiddle: false,
      ),
      backgroundColor: Colors.white,
    );
  }

  MarkdownBody get markdown {
    return MarkdownBody(
      data: widget.articleModel.article_content ?? '1',
      onTapLink: (url) {
        Navigator.push(context, CupertinoPageRoute(
          builder: (context) {
            return WebViewPage(url);
          }
        ));
      },
    );
  }
}
