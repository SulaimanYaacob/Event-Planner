import 'package:event_planner/models/events_model.dart';
import 'package:event_planner/services/events.service.dart';
import 'package:event_planner/widgets/events_tile.widget.dart';
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
    getEvents().then((value) => setState(() {
          events = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('John Doe'),
              accountEmail: Text('johndoe@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.amberAccent,
                child: Icon(
                  Icons.local_fire_department_outlined,
                  color: Colors.red,
                  size: 50,
                ),
              ),
            ),
            //TODO Create its own widget
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => {
                //Navigate to different page
              },
              autofocus: true,
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: events.map((event) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: EventTile(event: event));
        }).toList(),
      ),
    );
  }
}
