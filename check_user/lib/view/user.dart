import 'package:flutter/material.dart';

class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final user = userList[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.email),
            trailing: Text(user.source),
          );
        },
      ),
    );
  }
}

class User {
  final String name;
  final String email;
  final String source;

  User(this.name, this.email, this.source);
}

List<User> userList = [
  User('Aman', 'aman@gmail.com', 'Facebook'),
  // Add more user data
];
