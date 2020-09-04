import 'package:flutter/material.dart';
import 'home_page.dart';
import 'makeupAppbar.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: loginAppbar,
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
              googleSignInButton(),
              SizedBox(
                height: 10.0,
              ),
              twitterSignInButton(),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Back to Home',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget googleSignInButton() {
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
        // signInWithGoogle().whenComplete(() {
        //   Provider.of(context).push(MaterialPageRoute(
        //     builder: (context) => Profile(),
        //   ));
        // });
      },
    );
  }

  Widget twitterSignInButton() {
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
