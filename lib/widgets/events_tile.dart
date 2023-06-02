import 'package:event_planner/models/events_model.dart';
import 'package:flutter/material.dart';

class EventTile extends StatefulWidget {
  final Event event;
  const EventTile({Key? key, required this.event}) : super(key: key);

  @override
  State<EventTile> createState() => _EventTileState();
}

class _EventTileState extends State<EventTile> {
  bool _isFavorited = false;
  void toggleFavorite() {
    final eventTitle = widget.event.title;

    _isFavorited
        ? debugPrint('$eventTitle is Removed from favorites')
        : debugPrint('$eventTitle is Added to favorites');

    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    final event = widget.event;

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
              icon: _isFavorited
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(Icons.favorite_border),
              onPressed: toggleFavorite,
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
