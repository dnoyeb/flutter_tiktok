import 'package:flutter/material.dart';
import 'package:flutter_tiktok/page/home/care/care.page.dart';
import 'package:flutter_tiktok/page/home/recommend/recommend.page.dart';
import 'package:flutter_tiktok/page/home/vlogger/vlogger.page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String title = 'homePage';
  int _currentIndex = 0;
  PageController _pageController;

  _onPageChanged(index) {
    print(index);
  }

  @override
  void initState() {
    super.initState();
    this._pageController =
        PageController(initialPage: _currentIndex, keepPage: true);
  }

  final List<Widget> _tabBodies = [CarePage(), RecommendPage(), VloggerPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        allowImplicitScrolling: true,
        children: _tabBodies,
        controller: _pageController,
        // physics: NeverScrollableScrollPhysics(),
        onPageChanged: _onPageChanged,
      ),
    );
  }
}
