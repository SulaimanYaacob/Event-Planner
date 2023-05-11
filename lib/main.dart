import 'package:event_planner/event_page.dart';
import 'package:flutter/material.dart';
import 'package:event_planner/my_EventPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EventPage(),
    );
  }
}

class Palette {
  static const Color primary = Color(0xFFB71C1C);
}
