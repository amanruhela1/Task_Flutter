import 'package:flutter/material.dart';
import 'package:task/view/user.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  String selectedFilter = 'All';
  TextEditingController searchController = TextEditingController();

  List<User> getFilteredUsers() {
    if (selectedFilter == 'All') {
      return userList;
    } else {
      return userList.where((user) => user.source == selectedFilter).toList();
    }
  }

  List<User> getSearchedUsers() {
    final searchQuery = searchController.text.toLowerCase();
    return getFilteredUsers().where((user) {
      return user.name.toLowerCase().contains(searchQuery) ||
          user.email.toLowerCase().contains(searchQuery);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DropdownButton<String>(
                  value: selectedFilter,
                  onChanged: (value) {
                    setState(() {
                      selectedFilter = value!;
                    });
                  },
                  items: ['All', 'Facebook', 'Instagram', 'Organic', 'Friend', 'Google']
                      .map((source) => DropdownMenuItem(
                            value: source,
                            child: Text(source),
                          ))
                      .toList(),
                ),
                SizedBox(width: 16),
                Container(
                  width: 200, 
                  padding: EdgeInsets.only(bottom: 16),
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search by name or email',
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: getSearchedUsers().length,
              itemBuilder: (context, index) {
                final user = getSearchedUsers()[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: Text(user.source),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
