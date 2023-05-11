import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

//! This widget is hardcoded, will change later after we get the backend running.
class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey[200],
          width: double.infinity,
          height: 200,
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage("https://picsum.photos/200"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Text(
                "Some Name",
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
              const Text(
                "Some Name",
                style: TextStyle(color: Colors.grey, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
