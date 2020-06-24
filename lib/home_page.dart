import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  List<String> listdata = ['pien🥺', 'oko🥵', 'kusakoetemori🌲'];

  String get showPien => listdata[count];

  void pienchanged() {
    count++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('MakeupList'),
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
                            constraints: BoxConstraints(maxHeight: 44, maxWidth: 44, minHeight: 44, minWidth: 44),
                            child: Image.asset('assets/icon/makeup.png', fit: BoxFit.cover, color: Colors.white,),
                          ),
                          title: const Text('list1🥺',
                              style:
                                  TextStyle(fontSize: 24.0, color: Colors.white)),
                      ),
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
                            constraints: BoxConstraints(maxHeight: 44, maxWidth: 44, minHeight: 44, minWidth: 44),
                            child: Image.asset('assets/icon/makeup.png', fit: BoxFit.cover, color: Colors.white,),
                          ),
                          title: const Text('list2🥺',
                              style:
                                  TextStyle(fontSize: 24.0, color: Colors.white)),
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
                            constraints: BoxConstraints(maxHeight: 44, maxWidth: 44, minHeight: 44, minWidth: 44),
                            child: Image.asset('assets/icon/makeup.png', fit: BoxFit.cover, color: Colors.white,),
                          ),
                          title: const Text('list3🥺',
                              style:
                                  TextStyle(fontSize: 24.0, color: Colors.white)),
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
            Container(child: Text(showPien)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pienchanged,
        child: Icon(Icons.add),
      ),
    );
  }
}
