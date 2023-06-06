import 'package:event_planner/models/events_model.dart';
import 'package:flutter/material.dart';
import '../services/myevents.service.dart';
import 'package:event_planner/widgets/shared/build_text_form.dart';
import 'package:flutter/material.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({Key? key}) : super(key: key);

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        toolbarHeight: 125,
        title: Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(0.8),
            ),
            height: 100,
            width: 300,
            padding: const EdgeInsets.all(10),
            child: const Image(image: AssetImage('images/UTM.png')),
          ),
        ),
      ),
    );
  }
}
