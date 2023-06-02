import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planner/models/events_model.dart';

//! Please do CRUD method for any events here
class EventService {
  final CollectionReference eventCollection =
      FirebaseFirestore.instance.collection('EventPost');

  Future<List<Event>> getEvents() async {
    final List<Event> events = [];
    final QuerySnapshot eventSnapshot = await eventCollection.get();
    for (var element in eventSnapshot.docs) {
      events.add(Event.fromFirestore(element.data() as Map<String, dynamic>));
    }
    return events;
  }

  //getMyEvents
}
