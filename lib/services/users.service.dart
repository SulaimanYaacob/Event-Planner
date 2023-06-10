import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('Users');

  Future<String?> getUser() async {
    final DocumentSnapshot user =
        await _userCollection.doc(_firebaseAuth.currentUser!.uid).get();
    return user.data().toString();
  }

  displayUser() async {
    final DocumentSnapshot user =
        await _userCollection.doc(_firebaseAuth.currentUser!.uid).get();
    debugPrint(user.data().toString());
  }
}
