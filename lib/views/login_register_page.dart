// import 'package:flutter/material.dart';

// class RegistrationPage extends StatefulWidget {
//   const RegistrationPage({super.key});

//   @override
//   State<RegistrationPage> createState() => _RegistrationPageState();
// }

// class _RegistrationPageState extends State<RegistrationPage> {
//   final _formKey = GlobalKey<FormState>();

//   String _name = '';
//   String _email = '';
//   String _password = '';
//   String _confirmPassword = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Registration Page'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 16),
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     labelText: 'Name',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your name';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) {
//                     _name = value!;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your email';
//                     }
//                     if (!value.contains('@')) {
//                       return 'Please enter a valid email';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) {
//                     _email = value!;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 TextFormField(
//                   obscureText: true,
//                   decoration: const InputDecoration(
//                     labelText: 'Password',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a password';
//                     }
//                     if (value.length < 6) {
//                       return 'Password must be at least 6 characters long';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) {
//                     _password = value!;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 TextFormField(
//                   obscureText: true,
//                   decoration: const InputDecoration(
//                     labelText: 'Confirm Password',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please confirm your password';
//                     }
//                     if (value != _password) {
//                       return 'Passwords do not match';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) {
//                     _confirmPassword = value!;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       _formKey.currentState!.save();
//                       // do something with the form data, e.g. register the user
//                       print('Name: $_name');
//                       print('Email: $_email');
//                       print('Password: $_password');
//                       print('Confirm Password: $_confirmPassword');
//                     }
//                   },
//                   child: const Text('Submit'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/auth.dart';

class LoginRegisterPage extends StatefulWidget {
  LoginRegisterPage({Key? key}) : super(key: key);

  final String? errorMessage = '';
  final bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  final test = Auth();

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: widget._controllerEmail,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: widget._controllerPassword,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            OutlinedButton(
              onPressed: () async {
                try {
                  await widget.test.createUserWithEmailAndPassword(
                      email: widget._controllerEmail.text,
                      password: widget._controllerPassword.text);
                } catch (e) {
                  debugPrint(e.toString());
                }
              },
              child: const Text('Click To Register'),
            ),
            OutlinedButton(
              onPressed: () {
                debugPrint(widget.test.authState());
              },
              child: const Text('Click To Check State'),
            ),
            OutlinedButton(
              onPressed: () async {
                await widget.test.readUser().then((value) => debugPrint(value));
              },
              child: const Text('Click To test'),
            ),
          ],
        ),
      ),
    );
  }
}
