import 'package:event_planner/models/users_model.dart';
import 'package:event_planner/views/edit_profile.dart';
import 'package:flutter/material.dart';

class EditProfileButton extends StatefulWidget {
  final User user;
  final Function refreshProfile;
  const EditProfileButton(
      {Key? key, required this.user, required this.refreshProfile})
      : super(key: key);

  @override
  State<EditProfileButton> createState() => _EditProfileButtonState();
}

class _EditProfileButtonState extends State<EditProfileButton> {
  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    final refreshProfile = widget.refreshProfile;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(2),
              child: IconButton(
                onPressed: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditProfilePage(
                          user: user, refreshProfile: refreshProfile),
                    ));
                  });
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
                iconSize: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
