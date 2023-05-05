import 'package:event_planner/models/events_model.dart';
import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  final Event event;

  const EventTile({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: Material(
        color: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(4.0)),
        ),
        child: InkWell(
          onTap: () => debugPrint('Tapped ${event.title}'),
          child: GridTileBar(
            title: Text(event.title),
            subtitle: Text(event.subtitle),
            backgroundColor: Colors.black45,
            trailing: IconButton(
              splashRadius: 20.0,
              icon: const Icon(Icons.favorite_border),
              onPressed: () => debugPrint('Favorite'),
            ),
          ),
        ),
      ),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Image(
          image: NetworkImage(event.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
