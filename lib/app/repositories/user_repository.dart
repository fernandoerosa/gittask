
import 'dart:convert';

import 'package:gittask/app/repositories/models/user.dart';
import 'package:hive/hive.dart';

class UserRepository {

  static openBox() {
    var box = Hive.box<User>('users');

    box.put('user', User(uuid: "uuid", email: "email"));
    box.put('user1', User(uuid: "uuid", email: "email"));
    box.put('user2', User(uuid: "uuid", email: "email"));
    box.put('user3', User(uuid: "uuid", email: "email"));
    box.put('user4', User(uuid: "uuid", email: "email"));
    box.put('user5', User(uuid: "uuid", email: "email"));
    box.put('user6', User(uuid: "uuid", email: "email"));
    box.put('user7', User(uuid: "uuid", email: "email"));

    box.flush();

    List<User> users = box.values.toList();

    var user = box.get('user');

    print(users.toString());
  }
}