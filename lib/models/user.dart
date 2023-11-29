import 'package:flutter/cupertino.dart';

class User with ChangeNotifier {
  final String id;
  final String name;
  final String email;

  User(this.id, this.name, this.email);
}
