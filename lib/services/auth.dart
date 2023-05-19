import 'package:event_planner/models/user.dart' as Planner;
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  Planner.User? _userFromFirebaseUser(User? user) {
    return user != null ? Planner.User(uid: user.uid) : null;
  }
  
  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
        print(e.toString());
        return null;
    }
  }

  // sign in with email and password

  // register with email and password

  // sign out
}
