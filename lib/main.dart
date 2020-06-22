import 'package:flutter/material.dart';
import 'package:flutter_tiktok/page/ad/ad.page.dart';
import 'package:flutter_tiktok/provider/base.provider.dart';
import 'package:flutter_tiktok/provider/theme.provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BaseProvider>(
          create: (context) => BaseProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, model, child) {
          return MaterialApp(
            title: 'TikTOK',
            theme: ThemeData(
              primarySwatch: model.themeData,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: MyHomePage(),
            localizationsDelegates: [
              FlutterI18nDelegate(
                useCountryCode: false,
                fallbackFile: 'en',
                path: 'assets/i18n',
              ),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
}

class MyHomeState extends State<MyHomePage> {
  Locale currentLang;
  int clicked = 0;

  @override
  void initState() {
    super.initState();
    new Future.delayed(Duration.zero, () async {
      await FlutterI18n.refresh(context, new Locale('en'));
      setState(() {
        currentLang = FlutterI18n.currentLocale(context);
      });
    });
  }

  changeLanguage() {
    setState(() {
      currentLang = currentLang.languageCode == 'en'
          ? new Locale('en')
          : new Locale('zh');
    });
  }

  incrementCounter() {
    setState(() {
      clicked++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:
          new AppBar(title: new Text(FlutterI18n.translate(context, "title"))),
      body: new Builder(builder: (BuildContext context) {
        return new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(FlutterI18n.translate(context, "label.main",
                  Map.fromIterables(["user"], ["Flutter lover"]))),
              new Text(FlutterI18n.plural(context, "clicked.times", clicked)),
              new FlatButton(
                  onPressed: () async {
                    incrementCounter();
                  },
                  child: new Text(
                      FlutterI18n.translate(context, "button.clickMe"))),
              new FlatButton(
                  onPressed: () async {
                    changeLanguage();
                    await FlutterI18n.refresh(context, currentLang);
                    Scaffold.of(context).showSnackBar(new SnackBar(
                      content: new Text(
                          FlutterI18n.translate(context, "toastMessage")),
                    ));
                  },
                  child: new Text(
                      FlutterI18n.translate(context, "button.clickMe")))
            ],
          ),
        );
      }),
    );
  }
}
