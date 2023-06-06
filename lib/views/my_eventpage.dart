import 'package:event_planner/models/events_model.dart';
import 'package:event_planner/widgets/events_tile.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:event_planner/views/add_eventpage.dart';
import 'package:flutter/material.dart';
import '../services/myevents.service.dart';

class MyEventPage extends StatefulWidget {
  const MyEventPage({Key? key}) : super(key: key);

  @override
  State<MyEventPage> createState() => _MyEventPageState();
}

class _MyEventPageState extends State<MyEventPage>
    with SingleTickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _animationController;
  List<Event> events = [];

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    super.initState();
    EventService().getMyEvents().then((value) => setState(() {
          events = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionBubble(
        items: <Bubble>[
          Bubble(
            title: "Add Event",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.calendar_month,
            titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              //_animationController!.reverse();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddEventPage()));
            },
          )
        ],
        animation: _animation!,
        onPress: () => _animationController!.isCompleted
            ? _animationController!.reverse()
            : _animationController!.forward(),
        backGroundColor: Colors.blue,
        iconColor: Colors.white,
        iconData: Icons.menu,
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
