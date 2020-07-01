import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:makeup/auth.dart';
import 'package:makeup/card_create.dart';
import 'package:makeup/login_page.dart';
import 'package:makeup/profile.dart';

// landingPage参考に
//https://medium.com/coding-with-flutter/super-simple-authentication-flow-with-flutter-firebase-737bba04924c

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          FirebaseUser user = snapshot.data;
          print('user:' + user.uid);
          if (user != null) {
            return Profile(user: user);
          } else {
            print('user:' + user.displayName);
            return LoginPage();
          }
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

// @override
// void initState() {
//   FirebaseAuth.instance.currentUser().then((currentUser) => {
//         if (currentUser == null)
//           {Navigator.pushReplacementNamed(context, '/signIn')}
//         else
//           {
//             Firestore.instance
//                 .collection("users")
//                 .document(currentUser.uid)
//                 .get()
//                 .then((DocumentSnapshot result) => Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => Profile(
//                         uid: currentUser.uid,
//                       ),
//                     )))
//                 .catchError((err) => print(err))
//           }
//       });
//   super.initState();
// }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('name'),
//     ),
//     body: Center(
//         child: Container(
//       child: CircularProgressIndicator(
//         backgroundColor: Colors.pink,
//       ),
//     )),
//   );
// }
