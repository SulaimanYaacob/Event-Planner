import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planner/models/events_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

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

  Future<void> addEvent(Event event) async {
    await eventCollection
        .add(event.toFirestore())
        .then((DocumentReference doc) => eventCollection.doc(doc.id).set({
              'id': doc.id,
              'userId': FirebaseAuth.instance.currentUser!.uid,
              'title': event.title,
              'subtitle': event.subtitle,
              'description': event.description,
              'venue': event.venue,
              'date': event.date,
              'timeStart': event.timeStart,
              'timeEnd': event.timeEnd,
              'image': event.image,
              'recurring': event.recurring,
            }));
  }

  Future<List<Event>> getMyEvents(String id) async {
    final List<Event> events = [];
    final QuerySnapshot eventSnapshot =
        await eventCollection.where('userId', isEqualTo: id).get();
    for (var element in eventSnapshot.docs) {
      events.add(Event.fromFirestore(element.data() as Map<String, dynamic>));
    }
    return events;
  }

  Future<void> deleteEvent(String id) async {
    await eventCollection.doc(id).delete();
  }

  Future<void> updateEvent(Event event) async {
    await eventCollection.doc(event.id).update(event.toFirestore());
  }
}
