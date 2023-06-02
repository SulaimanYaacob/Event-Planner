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
        backgroundColor: Theme.of(context).primaryColor,
        toolbarHeight: 125,
        title: Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(0.8),
            ),
            height: 100,
            width: 300,
            padding: const EdgeInsets.all(10),
            child: const Image(image: AssetImage('images/UTM.png')),
          ),
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
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                    textAlign: TextAlign.center,
                  ),
                  RichText(
                    text: TextSpan(
                        text: isLogin
                            ? 'Don\'t have an account? Sign Up'
                            : 'Already have an account? Sign In',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => setState(() => isLogin = !isLogin),
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
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
                    textField('Email', _controllerEmail, 20, isLogin, context),
                    textField(
                        'Password', _controllerPassword, 20, isLogin, context),

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
                    _controllerPassword, _formKey, context)),
          ],
        ),
      ),
    );
  }
}

TextFormField textField(String label, TextEditingController input,
        double borderRadius, bool isLogin, BuildContext context) =>
    TextFormField(
      obscureText: label == 'Password',
      controller: input,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
      ),
      validator: (value) {
        if (isLogin) {
          //TODO Database Methods Auth To Check State
        }

        if (label == 'Email') {
          if (value!.isEmpty) {
            return 'Email Required';
          } else if (!value.contains('@')) {
            return 'Invalid Email';
          } else {
            return null;
          }
        }

        if (label == 'Password') {
          if (value!.isEmpty) {
            return 'Password Required';
          } else if (value.length < 6) {
            return 'Password must be at least 6 characters';
          } else {
            return null;
          }
        }

        return null;
      },
    );

ElevatedButton submitButton(
        Auth auth,
        bool isLogin,
        TextEditingController email,
        TextEditingController password,
        GlobalKey<FormState> formKey,
        BuildContext context) =>
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
        backgroundColor: Theme.of(context).primaryColor,
      ),
      child: Text(isLogin ? 'SIGN IN' : 'SIGN UP',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          )),
    );
