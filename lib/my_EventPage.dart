import 'package:flutter/material.dart';
import 'package:event_planner/widgets/events_tile.Widget.dart';
import 'package:event_planner/models/events_model.dart';
import 'package:event_planner/services/myEvents.service.dart';

class MyEventPage extends StatefulWidget {
  const MyEventPage({Key? key}) : super(key: key);

  @override
  State<MyEventPage> createState() => _MyEventPageState();
}

class _MyEventPageState extends State<MyEventPage> {
  List<Event> events = [];

  @override
  void initState() {
    super.initState();
    getMyEvents().then((value) => setState(() {
          events = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Events'),
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
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => {
                //navigate to a different page
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
            child: EventTile(event: event),
          );
        }).toList(),
      ),
    );
  }
}
