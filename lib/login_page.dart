import 'package:flutter/material.dart';
import 'package:makeup/profile.dart';
import 'auth.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('loginPage'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.blueAccent, Colors.pinkAccent])),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Image.asset(
                'assets/icon/eye-makeup.png',
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 10.0,
              ),
              _GoogleSignInButton(),
              SizedBox(
                height: 10.0,
              ),
              _TwitterSignInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _GoogleSignInButton() {
    return OutlineButton(
      splashColor: Colors.pink,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.pink),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Sign In with Google',
                style: TextStyle(fontSize: 20, color: Colors.pink),
              ),
            ),
          ],
        ),
      ),
      onPressed: () async {
        signInWithGoogle().whenComplete(() {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Profile(),
          ));
        });
      },
    );
  }

  Widget _TwitterSignInButton() {
    return OutlineButton(
        splashColor: Colors.pink,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        highlightElevation: 0,
        borderSide: BorderSide(color: Colors.blue),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Sign In with Twitter',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
        onPressed: () {});
  }
}
