import 'package:event_planner/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
 
  @override
  _SignInState createState() => _SignInState();
}
  class _SignInState extends State<SignIn> {

    final AuthService _auth = AuthService();

    // text field state
    String email = '';
    String password = '';

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: Text('Sign in to Event Planner'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),

          child: Form(
            child: Column(children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                child: Text('Sign in'),
                onPressed: () async {
                  print(email);
                  print(password);
                },
              ),
            ]),
          ),

          //Anon sign in button
          // child: ElevatedButton(
          //   child: Text('Sign in anon'),
          //   onPressed: () async{
          //     dynamic result = await _auth.signInAnon();
          //     if(result == null){
          //       print('error signing in');
          //     } else {
          //       print('signed in');
          //       print(result.uid);
          //     }
          //   },
          // ),
        ),
      );
    }
  }