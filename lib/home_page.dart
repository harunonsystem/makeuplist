import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:makeup/auth.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new HomePage(),
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

class HomePage extends StatefulWidget {
  final FirebaseUser user;
  HomePage({Key key, this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          centerTitle: true,
          title: Text('MakeupList'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.blueAccent, Colors.pinkAccent])),
          ),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.of(context).pushNamed('/root');
                // if(FirebaseAuth.instance.currentUser() != null){
                //   Navigator.of(context).pushNamed('/profile');
                // }else{
                //   Navigator.of(context).pushNamed('/login');
                // }
              },
            )
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection('users')
                .document(uid)
                .collection('list')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          elevation: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.pinkAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                            ),
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height / 6,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ListTile(
                                leading: ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxHeight: 44,
                                      maxWidth: 44,
                                      minHeight: 44,
                                      minWidth: 44),
                                  child: Image.asset(
                                    'assets/icon/makeup.png',
                                    fit: BoxFit.cover,
                                    color: Colors.white,
                                  ),
                                ),
                                title: Text(
                                  snapshot.data.documents[index]['title']
                                      .toString(),
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                subtitle: Text(
                                  snapshot.data.documents[index]['subtitle']
                                      .toString(),
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                         ), 
                         ),
                    );
                  },
                  itemCount: snapshot.data.documents.length,
                );
              }
            })
        );
  }
}
