import 'package:event_planner/models/users_model.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  final User user;
  const MyProfile({Key? key, required this.user}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    final user = widget.user;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 80,
          backgroundImage: NetworkImage(user.image),
        ),
        const SizedBox(height: 16),
        Text(
          user.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "@${user.username}   -   ${user.role[0].toUpperCase() + user.role.substring(1).toLowerCase()}   -   ${user.age.toString()}",
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            user.bio,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.call,
            ),
            Text(user.phonenum)
          ],
        )
      ],
    );
  }
}
