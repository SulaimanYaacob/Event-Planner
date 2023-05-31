import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // create user obj based on FirebaseUser
//   Planner.User? _userFromFirebaseUser(User? user) {
//     return user != null ? Planner.User(uid: user.uid) : null;
//   }

//   // auth change user stream
//   Stream<Planner.User?> get user {
//     return _auth.authStateChanges().map(_userFromFirebaseUser);
//   }

//   // sign in anon
//   Future signInAnon() async {
//     try {
//       UserCredential result = await _auth.signInAnonymously();
//       User? user = result.user;
//       return _userFromFirebaseUser(user);
//     } catch (e) {
//         print(e.toString());
//         return null;
//     }
//   }

//   // sign in with email and password
//   Future signInWithEmailAndPassword(String email, String password) async {
//     try {
//       UserCredential result = await _auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
//       User? user = result.user;
//       return _userFromFirebaseUser(user);
//     } catch (e) {
//         print(e.toString());
//         return null;
//     }
//   }

//   // register with email and password
//   Future registerWithEmailAndPassword(String email, String password) async {
//     try {
//       UserCredential result = await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
//       User? user = result.user;
//       return _userFromFirebaseUser(user);
//     } catch (e) {
//         print(e.toString());
//         return null;
//     }
//   }

//   // sign out
//   Future signOut() async {
//     try {
//       return await _auth.signOut();
//     } catch (e) {
//         print(e.toString());
//         return null;
//     }
//   }

// }

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('Users');

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String?> readUser() async {
    final DocumentSnapshot user =
        await _userCollection.doc('d7CMTjd7kK7HzpupXdw4').get();
    // debugPrint(user.data().toString());
    return user.data().toString();
  }

  authState() {
    _firebaseAuth.authStateChanges().listen((User? user) {
      user != null
          ? debugPrint('User is currently signed in ${user.uid}')
          : debugPrint('User is signed out! ${user?.uid}');
    });
  }

  test() {
    debugPrint('test');
  }
}
