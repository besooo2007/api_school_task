import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<User>> getuser() async {
  var response = await http.get(
    Uri.parse("https://dummyjson.com/users"),
  );

  if (response.statusCode == 200) {
    var json = jsonDecode(response.body);

    List usersJson = json['users'];

    List<User> users = [];

    for (var u in usersJson) {
      User user = User(
        u['id'],
        u['firstName'],
        u['lastName'],
        u['age'],
      );

      users.add(user);
    }

    return users;
  } else {
    throw Exception('Failed to load users');
  }
}

class User {
  int id;
  String firstName;
  String lastName;
  int age;

  User(this.id, this.firstName, this.lastName, this.age);
}