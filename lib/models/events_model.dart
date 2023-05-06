class Event {
  final int? id;
  final String title;
  final String subtitle;
  final String image;

  Event(
      {this.id,
      required this.title,
      required this.subtitle,
      required this.image});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      image: json['image'],
    );
  }
}
