import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _UserCollection = _firestore.collection('Users');
final CollectionReference _LikeCollection = _firestore.collection('Likes');

class FirebaseCRUD {
//Crud Method here
}
