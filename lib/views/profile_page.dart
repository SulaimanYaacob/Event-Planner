import 'package:event_planner/models/users_model.dart';
import 'package:event_planner/services/users.service.dart';
import 'package:event_planner/widgets/myprofile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User users;
  String userId = "johndoe";
  int i = 0;

  @override
  void initState() {
    super.initState();
    getUsers().then((value) => setState(() {
          while (i < value.length) {
            if (value.elementAt(i).username == userId) {
              users = value.elementAt(i);
              break;
            }
            i++;
          }
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: MyProfile(user: users),
    ));
  }
}
