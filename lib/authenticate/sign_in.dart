import 'package:event_planner/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({super.key, required this.toggleView});
 
  @override
  _SignInState createState() => _SignInState();
}
  class _SignInState extends State<SignIn> {

    final AuthService _auth = AuthService();
    final _formKey = GlobalKey<FormState>();

    // text field state
    String email = '';
    String password = '';
    String error = '';

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: Text('Sign in to Event Planner'),
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text('Register'),
              onPressed: () {
                widget.toggleView();
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          key: _formKey,
          child: Form(
            child: Column(children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                validator: (val) => val!.length < 8 ? 'Enter a password with atleast 8 characters long' : null,
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
                  if(_formKey.currentState!.validate()){
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() {
                        error = 'Could not sign in with those credentials';
                      });
                    }
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
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