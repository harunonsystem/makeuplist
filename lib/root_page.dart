import 'package:flutter/material.dart';
import 'package:makeup/login.dart';
import 'package:makeup/profile.dart';
import 'package:makeup/provider/provider_auth.dart';
import 'package:provider/provider.dart';

// landingPage参考に
//https://medium.com/coding-with-flutter/super-simple-authentication-flow-with-flutter-firebase-737bba04924c

// こっちが正しい
//https://qiita.com/ampersand-dev/items/636b78c78033ff3669a2
class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, AuthService authService, _) {
        switch (authService.status) {
          case Status.uninitialized:
            print('unititialized');
            return Login();
          case Status.unauthenticated:
          case Status.authenticating:
            print('signIn');
            return Login();
          case Status.authenticated:
            print('authenticated');
            break;
        }
        return Profile();
      },
    );
  }
}
