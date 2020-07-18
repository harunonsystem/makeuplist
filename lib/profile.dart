import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:makeup/home_page.dart';
import 'auth.dart';
import 'home_page.dart';

class Profile extends StatefulWidget {
  final FirebaseUser user;
  Profile({Key key, this.user, String uid}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    if (name != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            name,
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
                    imageUrl,
                  ),
                  radius: 60,
                  backgroundColor: Colors.transparent,
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                // Text(
                //   'uid: ' + uid,
                //   style: TextStyle(fontSize: 20.0, color: Colors.white),
                // ),
                Text(
                  email,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  onPressed: () {
                    signOutGoogle();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomePage()),
                        ModalRoute.withName('/'));
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
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
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
        signInWithGoogle().whenComplete(() {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Profile(),
          ));
        });
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
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('まだない'),
                );
              });
        });
  }
}
