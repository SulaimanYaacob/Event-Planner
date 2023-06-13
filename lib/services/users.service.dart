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
        return data['id'];
      } else if (userData == "email") {
        return data['email'].toString();
      } else if (userData == "password") {
        return data['password'].toString();
      } else if (userData == "isFirstTime") {
        return data['isFirstTime'].toString();
      } else if (userData == "username") {
        return data['username'].toString();
      } else if (userData == "bio") {
        return data['bio'].toString();
      } else if (userData == "age") {
        return data['age'].toString();
      } else if (userData == "job") {
        return data['job'].toString();
      } else if (userData == "phoneNum") {
        return data['phoneNum'].toString();
      } else if (userData == "profileImage") {
        return data['profileImage'].toString();
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<void> updateUser(
      String dataType, String userData, String value, bool isFirstTime) async {
    final DocumentSnapshot user =
        await _userCollection.doc(_firebaseAuth.currentUser!.uid).get();
    Map<String, dynamic> updateData = {};

    if (dataType == "String") {
      updateData[userData] = value;
    } else if (dataType == "int") {
      updateData[userData] = int.tryParse(value);
    } else if (dataType == "bool") {
      updateData[userData] = value == "true";
    }

    if (updateData[userData] == null) {
      updateData.remove(userData);
    }

    await _userCollection.doc(user.id).update(updateData);
  }
}
