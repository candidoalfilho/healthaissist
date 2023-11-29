import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:healthassist/models/doctor.dart';
import 'package:http/http.dart' as http;

class Doctors with ChangeNotifier {
  List<Doctor> _doctors = [];

  late Doctor loggedUser;

  final String? authToken;
  final String? userId;

  Doctors(this.authToken, this.userId, this._doctors);

  List<Doctor> get doctors {
    return [..._doctors];
  }

  Future<List<Doctor>?> fetchAllDoctors() async {
    var url = Uri.parse(
      'https://health-assist-498d9-default-rtdb.firebaseio.com/doctors.json?auth=$authToken',
    );
    try {
      final response = await http.get(url);

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      final List<Doctor> loadedDoctors = [];
      extractedData.forEach((key, userData) {
        // if (userData["userId"] == userId)
        loadedDoctors.add(Doctor(
            key,
            userData['nome'] as String,
            userData['especialidade'] as String,
            userData['biografia'] as String));
      });

      _doctors = loadedDoctors;
      notifyListeners();

      return loadedDoctors;
    } catch (error) {
      print(error);
    }
  }

  Future<List<Doctor>?> criarExame() async {
    var url = Uri.parse(
      'https://health-assist-498d9-default-rtdb.firebaseio.com/doctors.json?auth=$authToken',
    );
    try {
      final response = await http.get(url);

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      final List<Doctor> loadedDoctors = [];
      extractedData.forEach((key, userData) {
        // if (userData["userId"] == userId)
        loadedDoctors.add(Doctor(
            key,
            userData['nome'] as String,
            userData['especialidade'] as String,
            userData['biografia'] as String));
      });

      _doctors = loadedDoctors;
      notifyListeners();

      return loadedDoctors;
    } catch (error) {
      print(error);
    }
  }
}
