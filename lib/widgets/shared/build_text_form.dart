import 'package:flutter/material.dart';

class TextFieldConfig {
  final String label;
  final TextEditingController controller;
  final TextEditingController? controllerConfirmPassword;
  final double borderRadius;

  TextFieldConfig({
    required this.label,
    required this.controller,
    this.controllerConfirmPassword,
    required this.borderRadius,
  });
}

class BuildTextForm extends StatelessWidget {
  final TextFieldConfig config;
  const BuildTextForm({Key? key, required this.config}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:
          config.label == 'Password' || config.label == 'Confirm Password',
      controller: config.controller,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        labelText: config.label,
        labelStyle: const TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(config.borderRadius),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
        ),
        border: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(config.borderRadius))),
      ),
      validator: (value) {
        // if (config.isLogin) {
        //   //TODO Database Methods Auth To Check State
        // }

        if (config.label == 'Email') {
          if (value!.isEmpty) {
            return 'Email Required';
          } else if (!value.contains('@')) {
            return 'Invalid Email';
          } else {
            return null;
          }
        }

        if (config.label == 'Password') {
          if (value!.isEmpty) {
            return 'Password Required';
          } else if (value.length < 6) {
            return 'Password must be at least 6 characters';
          } else {
            return null;
          }
        }

        if (config.label == 'Confirm Password') {
          if (value!.isEmpty) {
            return 'Confirm Password Required';
          } else if (value != config.controllerConfirmPassword!.text) {
            return 'Password does not match';
          } else {
            return null;
          }
        }

        return null;
      },
    );
  }
}
