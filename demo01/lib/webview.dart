import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatelessWidget {
  String url;
  WebViewPage(this.url);

  FlutterWebviewPlugin plugin = FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    print('url is' + url);

    plugin.onScrollYChanged.listen((value) {
      print(value);
    });
//
    plugin.onStateChanged.listen((status) {
      print(status);
    });

    return WebviewScaffold(url: url,
      appBar: CupertinoNavigationBar(
        middle: Text('网页'),
      ),
    );
  }
}
