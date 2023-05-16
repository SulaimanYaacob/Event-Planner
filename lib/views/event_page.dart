import 'package:event_planner/models/events_model.dart';
import 'package:event_planner/services/events.service.dart';
import 'package:event_planner/widgets/events_tile.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  List<Event> events = [];

  @override
  void initState() {
    super.initState();
    EventService.getEvents().then((value) => setState(() {
          events = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: events.map((event) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: EventTile(event: event),
          );
        }).toList(),
      ),
    );
  }
}
