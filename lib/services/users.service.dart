import 'dart:convert';
import 'package:event_planner/models/users_model.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<List<User>> getUsers() async {
  final jsonData = await rootBundle.loadString('lib/data/userDetails.json');
  List<dynamic> jsonList = await json.decode(jsonData);
  List<User> users = [];
  for (var element in jsonList) {
    users.add(User.fromJson(element));
  }

  return users;
}
