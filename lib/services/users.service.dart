import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('Users');

  Future<String?> getUser(String userData) async {
    final DocumentSnapshot user =
        await _userCollection.doc(_firebaseAuth.currentUser!.uid).get();
    final data = user.data() as Map<String, dynamic>?;
    if (data != null) {
      if (userData == "id") {
        return data['id'].toString();
      } else if (userData == "email") {
        return data['email'].toString();
      } else if (userData == "password") {
        return data['password'].toString();
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
