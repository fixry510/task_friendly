import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_friendly/provider/models/person-helper.dart';
import 'package:task_friendly/provider/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  PersonHelp _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? PersonHelp(uid: user.uid, name: user.email) : null;
  }

  Stream<PersonHelp> get isLogin {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  Future signIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signUp({
    String email,
    String password,
    String name,
    String lastname,
    String age,
    String gender,
  }) async {
    print(name);
    print(lastname);
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      await Firestore.instance.collection('users').document(user.uid).setData({
        "email": email,
        "name": name,
        "lastname": lastname,
        "age": age,
        "gender": gender,
      });
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
