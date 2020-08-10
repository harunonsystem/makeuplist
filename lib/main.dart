import 'package:flutter/material.dart';
import 'package:makeup/card_create.dart';
import 'package:makeup/card_default.dart';
import 'package:makeup/card_detail.dart';
import 'package:makeup/home_page.dart';
import 'package:makeup/listview.dart';
import 'package:makeup/profile.dart';
import 'package:makeup/root_page.dart';
import 'login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: Splash(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
            '/create': (BuildContext context) => CardCreate(),
            '/detail': (BuildContext context) => CardDetail(),
            '/default': (BuildContext context) => CardDefault(),
            '/login': (BuildContext context) => LoginPage(),
            '/profile': (BuildContext context) => Profile(),
            '/root': (BuildContext context) => RootPage(),
            '/listview' : (BuildContext context) => ListViewPage(),
          },
        );
  }
}
