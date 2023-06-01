import 'package:event_planner/utils/gap_extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../services/auth.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({Key? key}) : super(key: key);
  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final auth = Auth();
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 125,
        title: const Align(
          alignment: Alignment.center,
          child: Image(
              image: AssetImage('images/UTM.png'), height: 250, width: 250),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isLogin ? 'Login' : 'Create New Account',
                    style: const TextStyle(
                        fontSize: 50, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  RichText(
                    text: TextSpan(
                        text: isLogin
                            ? 'Don\'t have an account? Sign Up'
                            : 'Already have an account? Sign In',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => setState(() => isLogin = !isLogin),
                        style: const TextStyle(color: Colors.blue)),
                  ),
                ].withSpaceBetween(height: 15),
              ),
            ),
            Form(
              key: _formKey,
              child: SizedBox(
                height: 250,
                child: Column(
                  children: [
                    textField('Email', _controllerEmail, 20, isLogin),
                    textField('Password', _controllerPassword, 20, isLogin),

                    // OutlinedButton(
                    //   onPressed: () {
                    //     debugPrint(widget.test.authState());
                    //   },
                    //   child: const Text('Click To Check State'),
                    // ),
                    // OutlinedButton(
                    //   onPressed: () async {
                    //     await widget.test
                    //         .readUser()
                    //         .then((value) => debugPrint(value));
                    //   },
                    //   child: const Text('Click To test'),
                    // ),
                    // OutlinedButton(
                    //   onPressed: () async {
                    //     await widget.test.signOut();
                    //   },
                    //   child: const Text('Click To Sign Out'),
                    // ),
                  ].withSpaceBetween(height: 25),
                ),
              ),
            ),
            Center(
                child: submitButton(auth, isLogin, _controllerEmail,
                    _controllerPassword, _formKey))
          ],
        ),
      ),
    );
  }
}

String? validator(bool isLogin, String value, String label) {
  if (isLogin) {
    // Database Methods Auth To Check State
  }

  if (label == 'Email') {
    if (value.isEmpty) {
      return 'Email Required';
    } else if (!value.contains('@')) {
      return 'Invalid Email';
    } else {
      return null;
    }
  }

  if (label == 'Password') {
    if (value.isEmpty) {
      return 'Password Required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    } else {
      return null;
    }
  }

  return null;
}

TextFormField textField(String label, TextEditingController input,
        double borderRadius, bool isLogin) =>
    TextFormField(
        obscureText: label == 'Password',
        controller: input,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        ),
        validator: (value) => validator(isLogin, value!, label));

ElevatedButton submitButton(
        Auth auth,
        bool isLogin,
        TextEditingController email,
        TextEditingController password,
        GlobalKey<FormState> formKey) =>
    ElevatedButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          if (isLogin) {
            try {
              await auth.signInWithEmailAndPassword(
                  email: email.text, password: password.text);
            } catch (e) {
              debugPrint(e.toString());
            }
          } else if (!isLogin) {
            try {
              await auth.createUserWithEmailAndPassword(
                  email: email.text, password: password.text);
            } catch (e) {
              debugPrint(e.toString());
            }
          }
        }
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(100, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(isLogin ? 'SIGN IN' : 'SIGN UP',
          style: const TextStyle(fontWeight: FontWeight.bold)),
    );
