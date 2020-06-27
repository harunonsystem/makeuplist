import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:makeup/home_page.dart';
import 'package:makeup/sign_in.dart';

class Profile extends StatefulWidget {
  final FirebaseUser user;
  Profile({Key key, this.user}): super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white),
              ),
              Text(
                email,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white),
              ),
              SizedBox(height: 10.0,),
              RaisedButton(
                onPressed: () {
                  signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }), ModalRoute.withName('/'));
                },
                color: Colors.pink,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('sign out', style: TextStyle(color: Colors.white),),
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
