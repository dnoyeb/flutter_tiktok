import 'package:flutter/material.dart';

class VloggerPage extends StatefulWidget {
  VloggerPage({Key key}) : super(key: key);

  @override
  _VloggerPageState createState() => _VloggerPageState();
}

class _VloggerPageState extends State<VloggerPage> {
  final String title = 'VloggerPage';

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
