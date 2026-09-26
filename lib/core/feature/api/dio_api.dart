import 'package:dio/dio.dart';

getuser() async {
  var response = await Dio().get(
    "https://dummyjson.com/users",
  );

  var json = response.data;

  List<User> users = [];

  for (var u in json['users']) {
    User user = User(
      u['id'],
      u['firstName'],
      u['lastName'],
      u['age'],
    );

    users.add(user);
  }

  return users;
}

class User {
  int id;
  String firstName;
  String lastName;
  int age;

  User(this.id, this.firstName, this.lastName, this.age);
}