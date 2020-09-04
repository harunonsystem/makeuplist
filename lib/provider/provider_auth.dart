import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum Status { uninitialized, authenticated, authenticating, unauthenticated }

class AuthService with ChangeNotifier {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth;
  FirebaseUser _user;

  Status _status = Status.uninitialized;

  AuthService.instance() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onAuthStateChanged);
  }

  FirebaseAuth get auth => _auth;
  Status get status => _status;

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    try {
      assert(_user.email != null);
      assert(_user.displayName != null);
      assert(_user.photoUrl != null);
      assert(_user.uid != null);

      _status = Status.authenticating;
      notifyListeners();
      await _auth.signInWithCredential(credential);
      _status = Status.authenticated;
      print(_user.uid);
    } catch (e) {
      print(e);
      _status = Status.unauthenticated;
      notifyListeners();
    }
  }

  // ignore: missing_return
  Future<void> _onAuthStateChanged(FirebaseUser firebaseUser) {
    if (firebaseUser == null) {
      _status = Status.unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.authenticated;
    }
    notifyListeners();
  }

  Future<void> signOutWithGoogle() async {
    await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
    await googleSignIn.disconnect();
    _status = Status.unauthenticated;
    print('Sign out');
    notifyListeners();
  }
}
