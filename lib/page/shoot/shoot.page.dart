import 'package:flutter/material.dart';

class ShootPage extends StatefulWidget {
  ShootPage({Key key}) : super(key: key);

  @override
  _ShootPageState createState() => _ShootPageState();
}

class _ShootPageState extends State<ShootPage> {
  final String title = 'ShootPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          title,
        ),
      ),
    );
  }
}
