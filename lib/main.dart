import 'package:event_planner/firebase_options.dart';
import 'package:event_planner/drawer_navigation.dart';
import 'package:event_planner/views/login_register_page.dart';
import 'package:event_planner/widgets/wrapper.dart';
import 'package:event_planner/models/user.dart' as Planner;
import 'package:event_planner/views/event_page.dart';
import 'package:event_planner/views/my_EventPage.dart';
import 'package:event_planner/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter_icons/flutter_icons.dart';
//import 'package:flutter_vector_icons/flutter_vector_icons.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // StreamProvider<Planner.User?>.value(
        //   value: AuthService().user,
        //   initialData: null,
        //   child:
        MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Wrapper(),
    );
    // );
  }
}
