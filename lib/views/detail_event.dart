import 'package:event_planner/models/events_model.dart';
import 'package:event_planner/services/auth.dart';
import 'package:event_planner/services/events.service.dart';
import 'package:event_planner/utils/gap_extension.dart';
import 'package:event_planner/views/update_eventpage.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'add_eventpage.dart';

class DetailEvent extends StatefulWidget {
  const DetailEvent({Key? key, required this.event}) : super(key: key);
  final Event event;
  @override
  State<DetailEvent> createState() => _DetailEvent();
}

class _DetailEvent extends State<DetailEvent>
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
  }

  @override
  Widget build(BuildContext context) {
    final bool isMyEvent = widget.event.userId == Auth().currentUser!.uid;
    final Event event = widget.event;
    final String eventDate = DateFormat('dd-MM-yyyy').format(event.date);
    final String startTime = DateFormat.jm().format(event.timeStart);
    final String endTime = DateFormat.jm().format(event.timeEnd);

    return Scaffold(
      floatingActionButton: isMyEvent
          ? FloatingActionBubble(
              items: <Bubble>[
                Bubble(
                  title: "Delete Event",
                  iconColor: Colors.white,
                  bubbleColor: Colors.blue,
                  icon: Icons.calendar_month,
                  titleStyle:
                      const TextStyle(fontSize: 16, color: Colors.white),
                  onPress: () {
                    EventService().deleteEvent(event.id ?? '');
                    Navigator.pop(context);
                  },
                ),
                Bubble(
                  title: "Update Event",
                  iconColor: Colors.white,
                  bubbleColor: Colors.blue,
                  icon: Icons.calendar_month,
                  titleStyle:
                      const TextStyle(fontSize: 16, color: Colors.white),
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (contextconst) =>
                                UpdateEventPage(eventId: event.id ?? '')));
                  },
                ),
              ],
              animation: _animation!,
              onPress: () {
                _animationController!.isCompleted
                    ? _animationController!.reverse()
                    : _animationController!.forward();
              },
              iconColor: Colors.blue,
              animatedIconData: AnimatedIcons.menu_close,
              backGroundColor: Colors.white,
            )
          : null,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(event.title),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 5),
                      image: DecorationImage(
                        image: NetworkImage(event.image ?? ''),
                        fit: BoxFit.cover,
                      )),
                  height: 300),
              Container(
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.black12,
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      event.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 20,
                      thickness: 2,
                      indent: 125,
                      endIndent: 125,
                    ),
                    Text(event.description ?? '', textAlign: TextAlign.center),
                  ].withSpaceBetween(height: 10),
                ),
                Table(
                  border: TableBorder.all(color: Colors.black, width: 2),
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(2),
                  },
                  children: [
                    tableRow('Venue', event.venue ?? ''),
                    tableRow('Date', eventDate),
                    tableRow('Time', startTime, endTime),
                    tableRow('Recurring', event.recurring ? 'Yes' : 'No'),
                  ],
                ),
                const SizedBox(height: 20),
              ].withSpaceBetween(height: 20),
            ),
          ),
        ],
      ),
    );
  }
}

TableRow tableRow(String title, String value, [String? value2]) {
  return TableRow(children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        value2 != null ? "$value - $value2" : value,
      ),
    ),
  ]);
}
