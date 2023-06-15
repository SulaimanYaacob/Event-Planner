import "package:event_planner/views/edit_profile.dart";
import "package:event_planner/views/profile_page.dart";
import "package:flutter/material.dart";

class ProfileNavigation extends StatefulWidget {
  const ProfileNavigation({Key? key}) : super(key: key);

  @override
  State<ProfileNavigation> createState() => _ProfileNavigationState();
}

class _ProfileNavigationState extends State<ProfileNavigation> {
  var currentPage = "viewProfile";
  Widget container = const ProfilePage();

  @override
  Widget build(BuildContext context) {
    if (currentPage == "viewProfile") {
      container = const ProfilePage();
    } else {
      container = const ProfilePage();
    }

    return container;
  }
}
