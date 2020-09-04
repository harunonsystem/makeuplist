import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
//   final FirebaseUser user;
//   HomePage({Key key, this.user}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);
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
              // Navigator.of(context).pushNamed('/root');
            },
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {
            Navigator.of(context).pushNamed('/listview');
          },
        ),
      ),
      body: user != null
          ? Center(
              child: StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection('users')
                      .document(user.email)
                      .collection('list')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
                            child: GestureDetector(
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
                                        colors: [
                                          Colors.pinkAccent,
                                          Colors.blueAccent
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight),
                                  ),
                                  width: MediaQuery.of(context).size.width / 2,
                                  height:
                                      MediaQuery.of(context).size.height / 6,
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
                                        snapshot
                                            .data.documents[index]['subtitle']
                                            .toString(),
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
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
                  }),
            )
          : Center(
              child: Column(
                children: <Widget>[
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
                                colors: [
                                  Colors.pinkAccent,
                                  Colors.blueAccent
                                ])),
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 6,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 24.0,
                            ),
                            ListTile(
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
                              title: Text('Template',
                                  style: TextStyle(
                                      fontSize: 24.0, color: Colors.white)),
                              subtitle: Text(
                                'This is a test.',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // if (name != null) {
          //   return _createDialog();
          // } else {
          //   return _needLogin();
          // }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pinkAccent,
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.black54,
          child: user != null
              ? Text(
                  'name: ' + user.email,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                )
              : Text(
                  'name: null',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                )),
    );
  }

//   _needLogin() async {
//     await showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('リストの追加にはユーザー登録が必要になります',
//                 style:
//                     TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
//             content: RaisedButton(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0)),
//               child: Text(
//                 '登録する',
//                 style: TextStyle(color: Colors.white),
//               ),
//               onPressed: () {
//                 Navigator.pushNamed(context, '/profile');
//               },
//               color: Colors.pinkAccent,
//             ),
//           );
//         });
//   }

//   _createDialog() async {
//     TextEditingController listTitleController = TextEditingController();
//     TextEditingController listSubtitleController = TextEditingController();
//     await showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text(
//               'リストのタイトルを入力✌️',
//               style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
//             ),
//             content: Builder(builder: (context) {
//               var height = MediaQuery.of(context).size.height / 6;
//               var width = MediaQuery.of(context).size.width / 2;
//               return Container(
//                 height: height,
//                 width: width,
//                 child: Column(
//                   children: <Widget>[
//                     TextFormField(
//                       controller: listTitleController,
//                       decoration: InputDecoration(hintText: 'list title...'),
//                     ),
//                     TextFormField(
//                       controller: listSubtitleController,
//                       decoration: InputDecoration(hintText: 'list subtitle...'),
//                     ),
//                   ],
//                 ),
//               );
//             }),
//             actions: <Widget>[
//               FlatButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   print(listTitleController.text);
//                   print(listSubtitleController.text);
//                   // Firestore.instance
//                   //     .collection('users')
//                   //     .document(uid)
//                   //     .collection('list')
//                   //     .add({
//                   //   'title': listTitleController.text,
//                   //   'subtitle': listSubtitleController.text,
//                   // });
//                   Navigator.pop(context);
//                 },
//               )
//             ],
//           );
//         });
//   }
// }
// // GestureDetector(
// //     onTap: () {
//       Navigator.of(context).pushNamed('/create');
//     },
//     child: Card(
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30.0)),
//         elevation: 10,
//         child: Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.0),
//                 gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: [Colors.greenAccent, Colors.green])),
//             width: MediaQuery.of(context).size.width / 2,
//             height: MediaQuery.of(context).size.height / 12,
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Center(
//                     child: const Text(
//                       'リストに追加',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18.0,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ],
//             ))))
}
