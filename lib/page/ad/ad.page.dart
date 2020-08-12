import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_tiktok/page/tab/tab.page.dart';
import 'package:flutter_tiktok/provider/theme.provider.dart';
import 'package:provider/provider.dart';

class AdPage extends StatefulWidget {
  AdPage({Key key}) : super(key: key);

  @override
  _AdPageState createState() => _AdPageState();
}

class _AdPageState extends State<AdPage> {
  final String title = 'AdPage';
  Timer timer;
  @override
  void initState() {
    super.initState();
    timer = new Timer(new Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        new MaterialPageRoute(builder: (context) => TabPage()),
      );
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  void nextPage() {
    timer?.cancel();
    timer = null;
    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(builder: (context) => TabPage()),
    );
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
            child: Opacity(
              opacity: 0.8,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    const Radius.circular(15.0),
                  ),
                  border: Border.all(width: 1.0, color: Colors.white),
                  color: Colors.grey[600],
                ),
                child: GestureDetector(
                  onTap: nextPage,
                  child: Text(
                    FlutterI18n.translate(context, "pass"),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
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
