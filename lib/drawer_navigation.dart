import 'package:event_planner/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'constants/drawer_sections.dart';
import 'views/event_page.dart';
import 'views/my_eventpage.dart';
import 'views/profile_page.dart';
import 'widgets/drawer.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  //final AuthService _auth = AuthService();

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  var currentPage = DrawerSections.events;
  Widget container = const EventPage();

  @override
  Widget build(BuildContext context) {
    // Use this as a page navigation
    if (currentPage == DrawerSections.events) container = const EventPage();
    if (currentPage == DrawerSections.myEvents) container = const MyEventPage();
    if (currentPage == DrawerSections.profile) {
      container = const ProfilePage();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
            currentPage.name[0].toUpperCase() + currentPage.name.substring(1)),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyDrawerHeader(),
              Container(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    menuItem(
                      1,
                      "Profile",
                      Icons.person,
                      currentPage == DrawerSections.profile ? true : false,
                    ),
                    menuItem(
                      2,
                      "Events",
                      Icons.event,
                      currentPage == DrawerSections.events ? true : false,
                    ),
                    menuItem(
                      3,
                      "My Events",
                      Icons.event_available,
                      currentPage == DrawerSections.myEvents ? true : false,
                    ),
                    menuItem(
                      4,
                      "Logout",
                      Icons.logout,
                      currentPage == DrawerSections.logout ? true : false,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[200] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) currentPage = DrawerSections.profile;
            if (id == 2) currentPage = DrawerSections.events;
            if (id == 3) currentPage = DrawerSections.myEvents;
            if (id == 4) signOut();
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
