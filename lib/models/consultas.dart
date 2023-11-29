import 'package:flutter/cupertino.dart';

class Consulta with ChangeNotifier {
  final String id;
  final String areaMedica;
  final String cidade;
  final String date;

  Consulta(this.id, this.areaMedica, this.cidade, this.date);
}
