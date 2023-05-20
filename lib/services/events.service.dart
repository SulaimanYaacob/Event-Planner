import 'dart:convert';
import 'package:event_planner/models/events_model.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<List<Event>> getEvents() async {
  final jsonData = await rootBundle.loadString('lib/data/events.json');
  List<dynamic> jsonList = await json.decode(jsonData);
  List<Event> events = [];
  for (var element in jsonList) {
    events.add(Event.fromJson(element));
  }

  return events;
}
