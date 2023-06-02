import 'dart:convert';
import 'package:http/http.dart' as http;

import 'user.dart';

class Users {
  static const String _baseUrl = 'http://192.168.1.149:8080/api/users';

  static Future<List<User>> getAllUsers() async {
    final response = await http.get(Uri.parse('$_baseUrl/users'));
    final data = json.decode(response.body) as List<dynamic>;

    return data.map((e) => User.fromJson(e)).toList();
  }
}
