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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Consumer<ThemeProvider>(
        builder: (context, model, child) {
          return FlatButton(
            color: Colors.tealAccent,
            onPressed: () => {model.setTheme(Colors.blue)},
            child: Icon(Icons.settings),
          );
        },
      ),
    );
  }
}
