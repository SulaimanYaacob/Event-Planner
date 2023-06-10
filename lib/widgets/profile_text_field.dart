import 'package:flutter/material.dart';

class ProfileTextField extends StatefulWidget {
  final String labelText;
  final String placeholder;
  final bool isPasswordTextField;
  const ProfileTextField({
    Key? key,
    required this.labelText,
    required this.placeholder,
    required this.isPasswordTextField,
  }) : super(key: key);

  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  bool isObscuredPassword = true;

  @override
  Widget build(BuildContext context) {
    final labelText = widget.labelText;
    final placeholder = widget.placeholder;
    final isPasswordTextField = widget.isPasswordTextField;

    return Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: TextField(
            obscureText: isPasswordTextField ? isObscuredPassword : false,
            decoration: InputDecoration(
                suffixIcon: isPasswordTextField
                    ? IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove_red_eye,
                            color: Colors.grey),
                      )
                    : null,
                contentPadding: const EdgeInsets.only(bottom: 5),
                labelText: labelText,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: placeholder,
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey))));
  }
}
