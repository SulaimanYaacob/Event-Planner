import 'package:event_planner/widgets/myprofile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.all(8.0),
      child: MyProfile(),
    ));
  }
}
