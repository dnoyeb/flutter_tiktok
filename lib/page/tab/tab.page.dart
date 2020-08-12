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

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      // bottomNavigationBar: Container(
      //   height: 60.0,
      //   color: Color.fromRGBO(0, 0, 0, 1),
      //   child: TabBar(
      //     isScrollable: false,
      //     controller: _tabController,
      //     indicatorColor: Color.fromRGBO(255, 255, 255, 0),
      //     unselectedLabelColor: Color.fromRGBO(255, 255, 255, .5),
      //     labelColor: Color.fromRGBO(255, 255, 255, 1),
      //     indicatorWeight: 0.1,
      //     onTap: (value) {
      //       // print(value);
      //     },
      //     tabs: <Widget>[
      //       Tab(text: FlutterI18n.translate(context, "tabName.tab0")),
      //       Tab(text: FlutterI18n.translate(context, "tabName.tab1")),
      //       Tab(text: '123'),
      //       Tab(text: FlutterI18n.translate(context, "tabName.tab3")),
      //       Tab(text: FlutterI18n.translate(context, "tabName.tab4")),
      //     ],
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Theme.of(context).primaryColor,
        backgroundColor: Color.fromRGBO(0, 0, 0, 1),
        // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(FlutterI18n.translate(context, "tabName.tab0")),
            backgroundColor: Color.fromRGBO(0, 0, 0, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye),
            title: Text(FlutterI18n.translate(context, "tabName.tab1")),
            backgroundColor: Color.fromRGBO(0, 0, 0, 1),
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye),
            title: Text(FlutterI18n.translate(context, "tabName.tab1")),
            backgroundColor: Color.fromRGBO(0, 0, 0, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text(FlutterI18n.translate(context, "tabName.tab3")),
            backgroundColor: Color.fromRGBO(0, 0, 0, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text(FlutterI18n.translate(context, "tabName.tab4")),
            backgroundColor: Color.fromRGBO(0, 0, 0, 1),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
