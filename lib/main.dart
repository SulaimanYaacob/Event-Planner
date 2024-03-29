import 'package:event_planner/drawer_navigation.dart';
import 'package:event_planner/firebase_options.dart';
import 'package:event_planner/services/auth.dart';
import 'package:event_planner/views/add_eventpage.dart';
import 'package:event_planner/views/detail_event.dart';
import 'package:event_planner/views/login_register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              primaryColor: Color(0xFF872D4A),
            ),
            routes: {
              '/addEvent': (context) => const AddEventPage(),
            },
            home: snapshot.data != null
                ? const Navigation()
                : const LoginRegisterPage(),
          );
        });
    // );
  }
}
