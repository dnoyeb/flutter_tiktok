import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:provider/provider.dart';
import 'package:flutter_tiktok/provider/base.provider.dart';
import 'package:flutter_tiktok/provider/theme.provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/loaders/decoders/json_decode_strategy.dart';

import 'package:flustars/flustars.dart';
import 'package:flutter_tiktok/utils/log_utils.dart';
import 'config/Constant.dart';
import 'package:flutter_tiktok/net/net.dart';

import 'package:flutter_tiktok/page/ad/ad.page.dart';

Future<void> main() async {
//  debugProfileBuildsEnabled = true;
//  debugPaintLayerBordersEnabled = true;
//  debugProfilePaintsEnabled = true;
//  debugRepaintRainbowEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();

  /// sp初始化
  await SpUtil.getInstance();
  runApp(MyApp());
  // 透明状态栏
  // if (Device.isAndroid) {
  //   SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  //   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  // }
}

class MyApp extends StatelessWidget {
  MyApp() {
    Log.init();
    initDio();
  }

  void initDio() {
    List<Interceptor> interceptors = [];

    /// 统一添加身份验证请求头
    interceptors.add(AuthInterceptor());

    /// 刷新Token
    interceptors.add(TokenInterceptor());

    /// 打印Log(生产模式去除)
    if (!Constant.inProduction) {
      interceptors.add(LoggingInterceptor());
    }
    setInitDio(
      baseUrl: 'http://10.1.36.49:3000/',
      interceptors: interceptors,
    );
  }

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
            home: AdPage(),
            localizationsDelegates: [
              FlutterI18nDelegate(
                translationLoader: FileTranslationLoader(
                    useCountryCode: false,
                    fallbackFile: 'zh',
                    basePath: 'assets/i18n',
                    forcedLocale: Locale('zh'),
                    decodeStrategies: [JsonDecodeStrategy()]),
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

// class MyHomePage extends StatefulWidget {
//   @override
//   MyHomeState createState() => new MyHomeState();
// }

// class MyHomeState extends State<MyHomePage> {
//   Locale currentLang;
//   int clicked = 0;

//   @override
//   void initState() {
//     super.initState();
//     new Future.delayed(Duration.zero, () async {
//       await FlutterI18n.refresh(context, new Locale('zh'));
//       // setState(() {
//       //   currentLang = FlutterI18n.currentLocale(context);
//       // });
//     });
//   }

//   changeLanguage() {
//     // setState(() {
//     //   currentLang = currentLang.languageCode == 'zh'
//     //       ? new Locale('zh')
//     //       : new Locale('en');
//     // });
//   }

//   incrementCounter() async {
//     setState(() {
//       clicked++;
//     });
//     Response response = await dio.get('user/1');
//     print(response);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar:
//           new AppBar(title: new Text(FlutterI18n.translate(context, "title"))),
//       body: new Builder(builder: (BuildContext context) {
//         return new Center(
//           child: new Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               new Text(FlutterI18n.plural(context, "clicked.times", clicked)),
//               new FlatButton(
//                   onPressed: () async {
//                     await FlutterI18n.refresh(context, new Locale('zh'));
//                     setState(() {});
//                     // incrementCounter();
//                   },
//                   child: new Text(
//                       FlutterI18n.translate(context, "button.clickMe"))),
//               new FlatButton(
//                   onPressed: () async {
//                     changeLanguage();
//                     await FlutterI18n.refresh(context, new Locale('en'));
//                     setState(() {});
//                     Scaffold.of(context).showSnackBar(new SnackBar(
//                       content: new Text(
//                           FlutterI18n.translate(context, "toastMessage")),
//                     ));
//                   },
//                   child: new Text(
//                       FlutterI18n.translate(context, "button.clickMe")))
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }
