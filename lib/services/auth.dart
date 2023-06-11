import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    await _userCollection.doc(currentUser!.uid).set({
      'id': currentUser!.uid,
      'email': email,
      'password': password,
      'newUser': true
    });
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String?> readUser() async {
    final DocumentSnapshot user =
        await _userCollection.doc(currentUser!.uid).get();
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
