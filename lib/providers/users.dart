import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class Users with ChangeNotifier {
  List<User> _users = [];

  late User? loggedUser;

  final String? authToken;
  final String? userId;

  Users(this.authToken, this.userId, this._users);

  List<User> get users {
    return [..._users];
  }

  Future<User?> fetchLoggedUserData() async {
    var url = Uri.parse(
      'https://uphealth-3643c-default-rtdb.firebaseio.com/users/$userId.json?auth=$authToken',
    );

    try {
      final response = await http.get(url);

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      loggedUser = User(
        userId!,
        extractedData['name'],
        extractedData['email'],
      );
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
