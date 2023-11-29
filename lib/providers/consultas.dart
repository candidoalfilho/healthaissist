import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:healthassist/models/consultas.dart';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class Consultas with ChangeNotifier {
  List<Consulta> _consultas = [];

  late Consulta? loggedUser;

  final String? authToken;
  final String? userId;

  Consultas(this.authToken, this.userId, this._consultas);

  List<Consulta> get consultas {
    return [..._consultas];
  }

  Future<void> createConsulta(Consulta consulta) async {
    var url = Uri.parse(
      'https://uphealth-3643c-default-rtdb.firebaseio.com/consultas.json?auth=$authToken',
    );

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'userId': consulta.id,
            'cidade': consulta.cidade,
            'areaMedica': consulta.areaMedica,
            'data': consulta.date
          },
        ),
      );

      // final extractedData = json.decode(response.body) as Map<String, dynamic>;
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<List<Consulta>?> fetchAllConsultas() async {
    var url = Uri.parse(
      'https://uphealth-3643c-default-rtdb.firebaseio.com/consultas.json?auth=$authToken',
    );
    try {
      final response = await http.get(url);

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      final List<Consulta> loadedConsultas = [];

      extractedData.forEach((key, userData) {
        // if (userData["userId"] == userId)
        loadedConsultas.add(Consulta(userData["userId"], userData['areaMedica'],
            userData['cidade'], userData['data']));
      });

      return loadedConsultas;
    } catch (error) {
      print(error);
    }
  }
}
