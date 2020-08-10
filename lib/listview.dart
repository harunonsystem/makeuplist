import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:makeup/makeupAppbar.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewState createState() => _ListViewState();
}

class _ListViewState extends State<ListViewPage> {
  FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: makeupAppbar,
        body: user != null
            ? Center(child: Text(user.displayName))
            : Center(
                child: Text('no data'),
              ));
  }
}