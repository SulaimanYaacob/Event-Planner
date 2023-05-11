import 'package:event_planner/widgets/materialColor.dart';
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
      title: 'Event Planner',
      theme: ThemeData(
        primarySwatch: generateMaterialColor(Palette.primary),
      ),
      home: const MyEventPage(),
    );
  }
}

class Palette {
  static const Color primary = Color(0xFFB71C1C);
}
