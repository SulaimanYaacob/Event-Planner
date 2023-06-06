import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planner/models/events_model.dart';

class EventService {
  //check collection in firebase?
  final CollectionReference eventCollection =
      FirebaseFirestore.instance.collection('MyEventPost');

  Future<List<Event>> getMyEvents() async {
    final List<Event> myevents = [];
    final QuerySnapshot eventSnapshot = await eventCollection.get();
    for (var element in eventSnapshot.docs) {
      myevents.add(Event.fromFirestore(element.data() as Map<String, dynamic>));
    }
    return myevents;
  }
  //getMyEvents
}
