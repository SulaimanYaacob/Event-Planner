import 'package:flutter/material.dart';
import '../services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({super.key, required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register>{

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
          title: Text('Sign up to Event Planner'),
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign in'),
              onPressed: () {
                widget.toggleView();
              },
            ),
          ],
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
                child: Text('Register'),
                onPressed: () async {
                  print(email);
                  print(password);
                },
              ),
            ]),
          ),
        ),
      );

  }
  

}