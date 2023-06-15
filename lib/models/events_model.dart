class Event {
  final String? id;
  final String title;
  final String subtitle;
  final String? description;
  final String? image;
  final String venue;
  final DateTime date;
  final DateTime timeStart;
  final DateTime timeEnd;
  final bool recurring;
  final String? userId;

  Event({
    this.id,
    required this.title,
    required this.subtitle,
    this.description,
    this.image,
    required this.venue,
    required this.date,
    required this.timeStart,
    required this.timeEnd,
    required this.recurring,
    this.userId,
  });

  factory Event.fromFirestore(Map<String, dynamic> firestore) {
    return Event(
      id: firestore['id'],
      title: firestore['title'],
      subtitle: firestore['subtitle'],
      description: firestore['description'],
      image: firestore['image'],
      venue: firestore['venue'],
      date: firestore['date'].toDate(),
      timeStart: firestore['timeStart'].toDate(),
      timeEnd: firestore['timeEnd'].toDate(),
      recurring: firestore['recurring'],
      userId: firestore['userId'],
    );
  }

// for update/create event
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'image': image,
      'venue': venue,
      'date': date,
      'timeStart': timeStart,
      'timeEnd': timeEnd,
      'recurring': recurring,
    };
  }
}
