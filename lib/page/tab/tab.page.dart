import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_tiktok/page/account/account.page.dart';
import 'package:flutter_tiktok/page/home/home.page.dart';
import 'package:flutter_tiktok/page/nearby/nearby.page.dart';
import 'package:flutter_tiktok/page/news/news.page.dart';
import 'package:flutter_tiktok/page/shoot/shoot.page.dart';

class TabPage extends StatefulWidget {
  TabPage({Key key}) : super(key: key);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  final String title = 'TabPage';
  List<Widget> pages = List<Widget>();
  int _selectedIndex = 0;
  TabController _tabController;

  @override
  void initState() {
    pages
      ..add(HomePage())
      ..add(NearbyPage())
      ..add(ShootPage())
      ..add(NewsPage())
      ..add(AccountPage());

    _tabController = TabController(length: pages.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _onItemTapped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: _bottomAppBar(),
    );
  }

  Widget tabItem(int index, String name) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          color: Color.fromRGBO(0, 0, 0, 0),
          alignment: Alignment.center,
          child: index != 2
              ? Text(
                  FlutterI18n.translate(context, name),
                  style: TextStyle(
                      color: Color.fromRGBO(
                          255, 255, 255, index == _selectedIndex ? 1 : .5)),
                )
              : Image.asset(
                  "assets/images/plus.png",
                  width: 45.0,
                  height: 45.0,
                ),
        ),
        onTap: () => _onItemTapped(index),
      ),
    );
  }

  List<String> nameArr = [
    "tabName.tab0",
    "tabName.tab1",
    "tabName.tab2",
    "tabName.tab3",
    "tabName.tab4"
  ];
  List<Widget> diyTab() {
    List<Widget> tabbar = [];
    for (var i = 0; i < nameArr.length; i++) {
      tabbar.add(tabItem(i, nameArr[i]));
    }
    return tabbar;
  }

  BottomAppBar _bottomAppBar() {
    double width = MediaQuery.of(context).size.width;
    double height = 60;

    return BottomAppBar(
      child: Container(
        color: Colors.black,
        width: width,
        height: height,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: diyTab(),
        ),
      ),
    );
  }
}
