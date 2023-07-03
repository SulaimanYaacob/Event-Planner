import 'package:event_planner/views/edit_profile.dart';
import 'package:event_planner/views/edit_profile_image.dart';
import 'package:event_planner/widgets/edit_profile_button.dart';
import 'package:flutter/material.dart';
import '../models/users_model.dart';
import '../widgets/profile_container.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User user = User("", "", "", "", "", 0, "", "", "", false);

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    User fetchedUser = await user.fetchData();

    setState(() {
      user = fetchedUser;
    });

    if (user.isFirstTime) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              EditProfilePage(user: user, refreshProfile: refreshProfile),
        ));
      });
    }
  }

  void refreshProfile() {
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Scaffold(
                // ignore: unnecessary_null_comparison
                body: user != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            ListView(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
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
                                          user.profileImage,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Container(
                                              height: 32,
                                              width: 32,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: Colors.white),
                                                  color: Colors.white70),
                                              child: IconButton(
                                                icon: const Icon(Icons.edit,
                                                    color: Colors.blue),
                                                iconSize: 15,
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditProfileImage(
                                                              refreshProfile:
                                                                  refreshProfile),
                                                    ),
                                                  );
                                                },
                                              )))
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(10, 10, 10, 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 10, 10, 10),
                                                    child: Icon(Icons.badge)),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                          10, 10, 10, 10),
                                                  child: Text(user.username),
                                                )
                                              ],
                                            )),
                                        Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(10, 10, 10, 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 10, 10, 10),
                                                    child:
                                                        Icon(Icons.summarize)),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                          10, 10, 10, 10),
                                                  child: Text(user.bio),
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                ProfileContainer(
                                    field1: 'Age',
                                    value1: user.age.toString(),
                                    icon1: Icons.hourglass_bottom,
                                    field2: 'Job',
                                    value2: user.job,
                                    icon2: Icons.work),
                                ProfileContainer(
                                    field1: 'Email',
                                    value1: user.email,
                                    icon1: Icons.email,
                                    field2: 'Phone Number',
                                    value2: user.phoneNum,
                                    icon2: Icons.phone),
                              ],
                            ),
                            EditProfileButton(
                                user: user, refreshProfile: refreshProfile),
                          ],
                        ),
                      )
                    : const Center(
                        child: Text('Failed to load user data.'),
                      ),
              ));
        }
      },
    );
  }
}
