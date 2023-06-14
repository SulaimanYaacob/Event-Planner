import 'package:event_planner/utils/gap_extension.dart';
import 'package:event_planner/widgets/shared/build_text_form.dart';
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
    final scaffoldMessenger = ScaffoldMessenger.of(context);
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
        //change column to listview
        child: ListView(
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
                    BuildTextForm(
                        config: TextFieldConfig(
                      label: 'Email',
                      controller: _controllerEmail,
                      borderRadius: 20,
                    )),
                    BuildTextForm(
                        config: TextFieldConfig(
                            label: 'Password',
                            controller: _controllerPassword,
                            borderRadius: 20)),
                  ].withSpaceBetween(height: 25),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (isLogin) {
                      try {
                        dynamic result = await auth.signInWithEmailAndPassword(
                          email: _controllerEmail.text,
                          password: _controllerPassword.text,
                        );
                        if (result != null) {
                          scaffoldMessenger.showSnackBar(
                            SnackBar(
                              content: Text(result),
                              action: SnackBarAction(
                                label: 'Okay',
                                onPressed: () {
                                  scaffoldMessenger.hideCurrentSnackBar();
                                },
                              ),
                            ),
                          );
                        }
                      } catch (e) {
                        debugPrint(e.toString());
                      }
                    } else if (!isLogin) {
                      try {
                        dynamic result =
                            await auth.createUserWithEmailAndPassword(
                          email: _controllerEmail.text,
                          password: _controllerPassword.text,
                        );

                        if (result != null) {
                          scaffoldMessenger.showSnackBar(
                            SnackBar(
                              content: Text(result),
                              action: SnackBarAction(
                                label: 'Okay',
                                onPressed: () {
                                  scaffoldMessenger.hideCurrentSnackBar();
                                },
                              ),
                            ),
                          );
                        }
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
                child: Text(
                  isLogin ? 'LOGIN' : 'REGISTER',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
