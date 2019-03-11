import 'package:banner/banner.dart';
import 'package:flutter/material.dart';



class BannerDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BannerDemoState();
  }

}

class _BannerDemoState extends State<BannerDemo> {
  @override
  Widget build(BuildContext context) {
    return BannerView(data: [
      'a', 'b', 'c',
    ],
      buildShowView: (int index, dynamic data) {
        return Image.network('https://ss0.baidu.com/73F1bjeh1BF3odCf/it/u=3468610260,4185014726&fm=85&s=CB0141845EB286D20C754DBE0300B006',
          fit: BoxFit.cover,
        );
      },
    );
  }

}