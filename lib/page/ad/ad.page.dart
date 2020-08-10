import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tiktok/provider/theme.provider.dart';
import 'package:provider/provider.dart';

class AdPage extends StatefulWidget {
  AdPage({Key key}) : super(key: key);

  @override
  _AdPageState createState() => _AdPageState();
}

class _AdPageState extends State<AdPage> {
  final String title = 'AdPage';

  void nextPage() {
    print(123);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(children: [
          Image.asset(
            "assets/images/adPage.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
              left: 30.0,
              top: 30.0,
              width: 60.0,
              height: 20.0,
              child: Container(
                child: GestureDetector(
                  onTap: nextPage, //写入方法名称就可以了，但是是无参的
                  child: Text(
                    '跳过',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
        ]),
      ),
      // appBar: AppBar(
      //   title: Text(title),
      // ),
      // body: Consumer<ThemeProvider>(
      //   builder: (context, model, child) {
      //     return FlatButton(
      //       color: Colors.tealAccent,
      //       onPressed: () => {model.setTheme(Colors.blue)},
      //       child: Icon(Icons.settings),
      //     );
      //   },
      // ),
    );
  }
}
