import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/user_api.dart';
import 'package:flutterapp/Services/globals.dart';
import 'package:http/http.dart' as http;



class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late List<User> _users;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  void _loadUsers() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users/2'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        _users = List<User>.from(jsonData.map((user) => User.fromJson(user)));
      });
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Users'),
      ),
      body: _users == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.email),

          );
        },
      ),
    );
  }
}
