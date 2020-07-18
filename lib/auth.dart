import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String name;
String email;
String imageUrl;
String uid;

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );
  // final AuthResult authResult = await _auth.signInWithCredential(credential);
  // final FirebaseUser user = authResult.user;
  final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;

  //add firestore
  FirebaseUser signedUser = user;
  if (signedUser != null) {
    Firestore.instance
        .collection('users')
        .document(signedUser.uid)
        .setData({'name': name, 'email': email, 'imgUrl': imageUrl});
  }
  // Checking if email and name is null
  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);
  assert(user.uid != null);

  name = user.displayName;
  email = user.email;
  imageUrl = user.photoUrl;
  uid = user.uid;
  print('user:' + name);
  return 'signInWithGoogle succeeded: $user';
}

@override
Future<void> signOutGoogle() async {
  await googleSignIn.signOut();
  await FirebaseAuth.instance.signOut();
  await googleSignIn.disconnect();
  FirebaseUser user;
  FirebaseUser signedUser = user;
  if (signedUser != null) {
    Firestore.instance.collection('users').document(signedUser.uid).delete();
  }

  print("User Sign Out");
}
