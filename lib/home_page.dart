import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:makeup/root_page.dart';
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
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/default');
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.pinkAccent, Colors.blueAccent])),
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 6,
                  child: Column(
                    children: <Widget>[
                      // Text('user' + name),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
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
                          title: const Text('list1🥺',
                              style: TextStyle(
                                  fontSize: 24.0, color: Colors.white)),
                        ),
                      ),
                      const Text(
                        '普段のメイク',
                        style: TextStyle(color: Colors.white),
                      ),
                      /*
                      ButtonTheme.bar(
                        child: ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Icon(
                                Icons.brush,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed('/default');
                              },
                            )
                          ],
                        ),
                      )
                      */
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/detail');
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.pinkAccent, Colors.blueAccent])),
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 6,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(3.0),
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
                          title: const Text('list2🥺',
                              style: TextStyle(
                                  fontSize: 24.0, color: Colors.white)),
                          //subtitle: const Text('推しと会うとき(´∩ω∩`*)' ,style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      const Text(
                        '推しと会うとき(´∩ω∩`*)',
                        style: TextStyle(color: Colors.white),
                      ),
                      // ButtonTheme.bar(
                      //   child: ButtonBar(
                      //     children: <Widget>[
                      //       FlatButton(
                      //         child: const Icon(
                      //           Icons.brush,
                      //           color: Colors.white,
                      //         ),
                      //         onPressed: () {},
                      //       )
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/create');
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.pinkAccent, Colors.blueAccent])),
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 6,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(3.0),
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
                          title: const Text('list3🥺',
                              style: TextStyle(
                                  fontSize: 24.0, color: Colors.white)),
                        ),
                      ),
                      ButtonTheme.bar(
                        child: ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Icon(
                                Icons.brush,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/create');
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.greenAccent, Colors.green])),
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 12,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: const Text(
                            'リストに追加',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
