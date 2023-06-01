import 'package:event_planner/services/auth.dart';
import 'package:event_planner/views/login_register_page.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        // if (snapshot.hasData) {
        //   return const Navigation();
        // } else {
        // }
        return LoginRegisterPage();
      },
    );
  }
}
