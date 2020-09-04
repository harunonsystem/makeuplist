import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:makeup/home_page.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'package:makeup/provider/provider_auth.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);
    return Consumer(
      builder: (context, AuthService authService, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              user.displayName,
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[Colors.blueAccent, Colors.pinkAccent])),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.pinkAccent, Colors.blueAccent])),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      user.photoUrl,
                    ),
                    radius: 60,
                    backgroundColor: Colors.transparent,
                  ),
                  Text(
                    user.displayName,
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  Text(
                    user.email,
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RaisedButton(
                    onPressed: () {
                      authService.signOutWithGoogle();
                    },
                    color: Colors.pink,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'sign out',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  SizedBox(
                    height: 24.0,
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
      },
    );
  }
}
