import 'package:flutter/material.dart';

class CarePage extends StatefulWidget {
  CarePage({Key key}) : super(key: key);

  @override
  _CarePageState createState() => _CarePageState();
}

class _CarePageState extends State<CarePage> {
  final String title = 'CarePage';

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
