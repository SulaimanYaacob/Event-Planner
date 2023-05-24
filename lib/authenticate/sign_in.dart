import 'package:event_planner/services/auth.dart';
import 'package:event_planner/widgets/inputDecoration.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
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
        title: const Text('Sign in to Event Planner'),
        actions: <Widget>[
          TextButton.icon(
            icon: const Icon(Icons.person),
            label: const Text('Register'),
            onPressed: () {
              widget.toggleView();
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        key: _formKey,
        //Sign in Email and Password
        child: Form(
          child: Column(children: <Widget>[
            const SizedBox(height: 20.0),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Email'),
              validator: (val) => val!.isEmpty ? 'Enter an email' : null,
              onChanged: (val) {
                setState(() {
                  email = val;
                });
              },
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Password'),
              obscureText: true,
              validator: (val) => val!.length < 8
                  ? 'Enter a password with atleast 8 characters long'
                  : null,
              onChanged: (val) {
                setState(() {
                  password = val;
                });
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text('Sign in'),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  dynamic result =
                      await _auth.signInWithEmailAndPassword(email, password);
                  if (result == null) {
                    setState(() {
                      error = 'Could not sign in with those credentials';
                    });
                  }
                }
              },
            ),
            const SizedBox(height: 12.0),
            Text(
              error,
              style: const TextStyle(color: Colors.red, fontSize: 14.0),
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
