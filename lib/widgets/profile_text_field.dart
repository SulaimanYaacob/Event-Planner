import 'package:flutter/material.dart';

class ProfileTextField extends StatefulWidget {
  final String labelText;
  final String placeholder;
  final bool isPasswordTextField;
  final TextEditingController controller;
  const ProfileTextField(
      {Key? key,
      required this.labelText,
      required this.placeholder,
      required this.isPasswordTextField,
      required this.controller})
      : super(key: key);

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
    final controller = widget.controller;

    return Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: TextField(
            obscureText: isPasswordTextField ? isObscuredPassword : false,
            controller: controller,
            decoration: InputDecoration(
                suffixIcon: isPasswordTextField
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isObscuredPassword = !isObscuredPassword;
                          });
                        },
                        icon: Icon(
                          isObscuredPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
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
