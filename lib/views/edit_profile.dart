import 'package:flutter/material.dart';
import 'package:event_planner/widgets/profile_text_field.dart';
import 'package:event_planner/views/profile_page.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          Center(
            child: Stack(
              children: [
                Container(
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
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 4, color: Colors.white),
                            color: Colors.blue),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        )))
              ],
            ),
          ),
          const SizedBox(height: 30),
          const ProfileTextField(
              labelText: "Username",
              placeholder: "Username",
              isPasswordTextField: false),
          const ProfileTextField(
              labelText: "Password",
              placeholder: "Password",
              isPasswordTextField: true),
          const ProfileTextField(
              labelText: "Bio", placeholder: "Bio", isPasswordTextField: false),
          const ProfileTextField(
              labelText: "Email",
              placeholder: "Email",
              isPasswordTextField: false),
          const ProfileTextField(
              labelText: "Phone Number",
              placeholder: "Phone Number",
              isPasswordTextField: false),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
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
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(MaterialPageRoute(
                      builder: (context) => const ProfilePage()));
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
