import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:makeup/home_page.dart';
import 'package:makeup/login_page.dart';
import 'auth.dart';

class Profile extends StatefulWidget {
  final FirebaseUser user;
  Profile({Key key, this.user, String uid}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
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
          child: name != null ? Text('no data') : Column(
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
                name != null ? name: "no data",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              // Text(
              //   'uid: ' + uid,
              //   style: TextStyle(fontSize: 20.0, color: Colors.white),
              // ),
              Text(
                email != null ? email: "no data",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                onPressed: () {
                  signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }), ModalRoute.withName('/login'));
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
              SizedBox(height: 24.0,),
              RaisedButton(
                onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
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
