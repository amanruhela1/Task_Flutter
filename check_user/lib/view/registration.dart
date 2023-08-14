import 'package:flutter/material.dart';
import 'package:task/view/user.dart';

class UserRegistrationScreen extends StatefulWidget {
  @override
  _UserRegistrationScreenState createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String? _source;

  void _registerUser() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      User newUser = User(_name, _email, _source!);
      userList.add(newUser);
      Navigator.pushNamed(context, '/userList');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Registration'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField(
                value: _source,
                onChanged: (value) {
                  setState(() {
                    _source = value.toString();
                  });
                },
                items: ['Facebook', 'Instagram', 'Organic', 'Friend', 'Google']
                    .map((source) => DropdownMenuItem(
                          value: source,
                          child: Text(source),
                        ))
                    .toList(),
                decoration: InputDecoration(labelText: 'Where are you coming from?'),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: _registerUser,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, 
                    onPrimary: Colors.white, 
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), 
                    ),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 16), 
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
