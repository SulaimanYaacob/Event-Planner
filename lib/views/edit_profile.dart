import 'package:event_planner/models/users_model.dart';
import 'package:event_planner/services/users.service.dart';
import 'package:flutter/material.dart';
import 'package:event_planner/widgets/profile_text_field.dart';
import 'package:event_planner/views/profile_page.dart';

class EditProfilePage extends StatefulWidget {
  final User user;
  final Function refreshProfile;
  const EditProfilePage(
      {Key? key, required this.user, required this.refreshProfile})
      : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _phoneNumController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadUserData(); // Load user data into text fields
  }

  void loadUserData() {
    final user = widget.user;
    if (user.username.startsWith('@')) {
      _usernameController.text = user.username.substring(1);
    } else {
      _usernameController.text = user.username;
    }
    _bioController.text = user.bio;
    _ageController.text = user.age.toString();
    _jobController.text = user.job;
    _phoneNumController.text = user.phoneNum;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _bioController.dispose();
    _ageController.dispose();
    _jobController.dispose();
    _phoneNumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isFirstTime = widget.user.isFirstTime;

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          Center(
            child: Container(
              width: 120,
              height: 120,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                'https://picsum.photos/seed/838/600',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 30),
          ProfileTextField(
              labelText: "Username",
              placeholder: "Username",
              isPasswordTextField: false,
              controller: _usernameController),
          ProfileTextField(
              labelText: "Bio",
              placeholder: "Bio",
              isPasswordTextField: false,
              controller: _bioController),
          ProfileTextField(
              labelText: "Age",
              placeholder: "Age",
              isPasswordTextField: false,
              controller: _ageController),
          ProfileTextField(
              labelText: "Job",
              placeholder: "Job",
              isPasswordTextField: false,
              controller: _jobController),
          ProfileTextField(
            labelText: "Phone Number",
            placeholder: "Phone Number",
            isPasswordTextField: false,
            controller: _phoneNumController,
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: !isFirstTime,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop(MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
                  },
                  style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text("CANCEL",
                      style: TextStyle(
                          fontSize: 15, letterSpacing: 2, color: Colors.black)),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (isFirstTime) {
                    await UserService()
                        .updateUser("bool", "isFirstTime", "false");
                  }

                  if (!(_usernameController.text == "")) {
                    String username = _usernameController.text;
                    await UserService()
                        .updateUser("String", "username", "@$username");
                  }
                  if (!(_bioController.text == "")) {
                    String bio = _bioController.text;
                    await UserService().updateUser("String", "bio", bio);
                  }
                  if (!(_ageController.text == "")) {
                    String age = _ageController.text;
                    await UserService().updateUser("int", "age", age);
                  }
                  if (!(_jobController.text == "")) {
                    String job = _jobController.text;
                    await UserService().updateUser("String", "job", job);
                  }
                  if (!(_phoneNumController.text == "")) {
                    String phoneNum = _phoneNumController.text;
                    await UserService()
                        .updateUser("String", "phoneNum", phoneNum);
                  }

                  widget.refreshProfile();
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text("SAVE",
                    style: TextStyle(
                        fontSize: 15, letterSpacing: 2, color: Colors.white)),
              )
            ],
          )
        ],
      ),
    ));
  }
}
