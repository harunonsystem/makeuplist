import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:makeup/card_create.dart';
import 'package:makeup/card_default.dart';
import 'package:makeup/card_detail.dart';
import 'package:makeup/listview.dart';
import 'package:makeup/profile.dart';
import 'package:makeup/provider/provider_auth.dart';
import 'package:makeup/root_page.dart';
import 'package:makeup/splash_page.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';

void main() {
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider.value(value: FirebaseAuth.instance.onAuthStateChanged),
        ChangeNotifierProvider(create: (_) => AuthService.instance()),
        // Provider<AuthService>.value(
        //     value: AuthService.instance(),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.light(),
        home: Splash(),
        initialRoute: '/root',
        routes: <String, WidgetBuilder>{
          '/create': (BuildContext context) => CardCreate(),
          '/detail': (BuildContext context) => CardDetail(),
          '/default': (BuildContext context) => CardDefault(),
          '/login': (BuildContext context) => LoginPage(),
          '/profile': (BuildContext context) => Profile(),
          '/root': (BuildContext context) => RootPage(),
          '/listview': (BuildContext context) => ListViewPage(),
        },
      ),
    );
  }
}
