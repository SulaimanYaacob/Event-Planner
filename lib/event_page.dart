import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Events'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text('John Doe'),
                accountEmail: Text('johndoe@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.amberAccent,
                  child: Icon(
                    Icons.local_fire_department_outlined,
                    color: Colors.red,
                    size: 50,
                  ),
                ),
              ),
              //TODO Create its own widget
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () => {
                  //Navigate to different page
                },
                autofocus: true,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              Stack(
                children: [
                  GridTile(
                    footer: Material(
                      color: Colors.transparent,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(4.0))),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () => debugPrint('Event 1'),
                        child: GridTileBar(
                          title: const Text('Event 1'),
                          subtitle: const Text('Subtitle'),
                          backgroundColor: Colors.black45,
                          trailing: IconButton(
                            splashRadius: 20.0,
                            icon: const Icon(Icons.favorite_border),
                            onPressed: () => {
                              debugPrint('Favorite'),
                            },
                          ),
                        ),
                      ),
                    ),
                    child: Semantics(
                      child: Material(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0)),
                        clipBehavior: Clip.antiAlias,
                        child: const Image(
                          image: NetworkImage(
                              'https://picsum.photos/250?image=53'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
