import 'package:flutter/material.dart';
import 'package:makeup/root_page.dart';
import 'package:splashscreen/splashscreen.dart';

import 'home_page.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new RootPage(),
      title: const Text(
        'Welcome to MakeupList',
        style: TextStyle(color: Colors.pinkAccent, fontSize: 24.0),
      ),
      image: Image.asset('assets/icon/eye-makeup.png'),
      backgroundColor: Colors.white,
      photoSize: 180.0,
      loaderColor: Colors.pinkAccent,
    );
  }
}
